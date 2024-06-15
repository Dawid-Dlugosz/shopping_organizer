import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/auth/domain/repository/auth_repository.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.authRepository,
    this.customUserCubit,
    this.firebaseMessaging,
  ) : super(const AuthState.unAuthorized());

  final AuthRepository authRepository;
  final CustomUserCubit customUserCubit;
  final FirebaseMessaging firebaseMessaging;

  StreamSubscription<User?>? _streamSubscription;

  Future<void> sessionListener() async {
    final stream = await authRepository.sessionListener();
    _streamSubscription = stream.listen(
      (user) {
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

  Future<void> signIn({required String email, required String password}) async {
    emit(const AuthState.unAuthorized());

    final failureOrUserCredential = await authRepository.signIn(
      email: email,
      password: password,
    );

    failureOrUserCredential.fold(
      (failure) => _emitError(failure),
      (userCredential) => _customUserService(userCredential),
    );
  }

  Future<void> _customUserService(UserCredential userCredential) async {
    await customUserCubit.getCustomUser(userId: userCredential.user!.uid);
    emit(
      AuthState.authorized(
        user: userCredential.user!,
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
    );

    failureOrUserCredential.fold(
      (failure) => _emitError(failure),
      (userCredential) => _createCustomUserService(
        nickname: nickname,
        userCredential: userCredential,
      ),
    );
  }

  Future<void> _createCustomUserService({
    required UserCredential userCredential,
    required String nickname,
  }) async {
    final fcmToken = (await firebaseMessaging.getToken())!;

    final customUser = CustomUser(
      fcmToken: fcmToken,
      userId: userCredential.user!.uid,
      shoppingLists: [],
      nickname: nickname,
    );

    await customUserCubit.createCustomUser(customUser: customUser);

    emit(
      AuthState.authorized(
        user: userCredential.user!,
      ),
    );
  }

  // TODO TESTY
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
