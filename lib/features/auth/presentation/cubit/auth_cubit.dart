import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_organizer/features/auth/domain/repository/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState.unAuthorized());

  final AuthRepository authRepository;

  Future<void> signIn({required String email, required String password}) async {
    final failureOrUserCredential = await authRepository.signIn(
      email: email,
      password: password,
    );

    failureOrUserCredential.fold(
      (failure) => failure.map(
        auth: (code) => emit(AuthState.error(code: code.message)),
        general: (_) => emit(const AuthState.error()),
      ),
      (userCredential) =>
          emit(AuthState.authorized(user: userCredential.user!)),
    );
  }
}
