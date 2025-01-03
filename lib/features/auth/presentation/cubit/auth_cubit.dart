import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/auth/domain/repository/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.authRepository,
  ) : super(const AuthState.unAuthorized());

  final AuthRepository authRepository;

  StreamSubscription<User?>? _streamSubscription;

  Future<void> sessionListener() async {
    final stream = await authRepository.sessionListener();
    _streamSubscription = stream.listen(
      (user) {
        print('sdfsdfsa $user');
        if (user != null) {
          emit(
            AuthState.authorized(
              user: user,
            ),
          );
        } else {
          emit(const AuthState.unAuthorized());
        }
      },
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());

    final failureOrUserCredential = await authRepository.login(
      email: email,
      password: password,
    );

    failureOrUserCredential.fold(
      (failure) => _emitError(failure),
      (userCredential) => emit(
        AuthState.authorized(user: userCredential.user!),
      ),
    );
  }

  Future<void> loginViaGoogle() async {
    emit(const AuthState.loading());
    final failureOrUserCredential = await authRepository.loginViaGoogle();

    failureOrUserCredential.fold((failure) => _emitError(failure),
        (userCredential) {
      if (userCredential != null) {
        emit(
          AuthState.authorized(user: userCredential.user!),
        );
      }
    });
  }

  Future<void> loginViaFacebook() async {
    emit(const AuthState.loading());

    final failureOrUserCredential = await authRepository.loginViaFacebook();

    failureOrUserCredential.fold((failure) => _emitError(failure),
        (userCredential) {
      if (userCredential != null) {
        emit(
          AuthState.authorized(user: userCredential.user!),
        );
      }
    });
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String nickname,
  }) async {
    emit(const AuthState.loading());

    final failureOrUser = await authRepository.createAccount(
      email: email,
      password: password,
      nickname: nickname,
    );

    failureOrUser.fold(
      (failure) => _emitError(failure),
      (user) => emit(
        AuthState.authorized(user: user),
      ),
    );
  }

  Future<void> signOut() async {
    await authRepository.signOut();
    emit(const AuthState.unAuthorized());
  }

  void _emitError(Failure failure) {
    failure.mapOrNull(
      auth: (code) => emit(AuthState.error(code: code.message)),
      general: (_) => emit(const AuthState.error()),
    );
  }

  @disposeMethod
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
