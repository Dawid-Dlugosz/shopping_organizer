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
  AuthCubit(this.authRepository) : super(const AuthState.unAuthorized());

  final AuthRepository authRepository;

  Future<void> signIn({required String email, required String password}) async {
    emit(const AuthState.unAuthorized());
    final failureOrUserCredential = await authRepository.signIn(
      email: email,
      password: password,
    );

    failureOrUserCredential.fold(
      (failure) => _emitError(failure),
      (userCredential) => emit(
        AuthState.authorized(
          user: userCredential.user!,
        ),
      ),
    );
  }

  Future<void> signOn({
    required String email,
    required String password,
    required String nickname,
  }) async {
    emit(const AuthState.unAuthorized());

    final failureOrUserCredential = await authRepository.signOn(
      email: email,
      password: password,
      displayName: nickname,
    );

    failureOrUserCredential.fold(
      (failure) => _emitError(failure),
      (userCredential) => emit(
        AuthState.authorized(
          user: userCredential.user!,
        ),
      ),
    );
  }

  void _emitError(Failure failure) {
    failure.mapOrNull(
      auth: (code) => emit(AuthState.error(code: code.message)),
      general: (_) => emit(const AuthState.error()),
    );
  }
}
