import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_organizer/core/enums/firebase_auth_error.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/auth/domain/repository/auth_repository.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late AuthCubit cubit;
  late MockAuthRepository authRepository;
  late MockUserCredential userCredential;
  late MockUser user;

  setUp(() {
    userCredential = MockUserCredential();
    user = MockUser();
    authRepository = MockAuthRepository();
    cubit = AuthCubit(authRepository);
  });

  group(
    'AuthCubit',
    () {
      group(
        'signIn',
        () {
          test(
            'Should emit [UnAuthorized] as a first state',
            () {
              expect(cubit.state, const AuthState.unAuthorized());
            },
          );

          blocTest(
            'Shoule emit [Authorized] when repo return UserCredential',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.signIn(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer((_) async => Right(userCredential));

              when(() => userCredential.user).thenReturn(user);
            },
            act: (_) {
              cubit.signIn(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              AuthState.authorized(user: user),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn null code return Failure.general',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.signIn(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer((_) async => const Left(Failure.general()));
            },
            act: (_) {
              cubit.signIn(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              const AuthState.error(),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn invalid-email code return Failure.general',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.signIn(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(
                    message: FirebaseAuthError.invalidEmail.code,
                  ),
                ),
              );
            },
            act: (_) {
              cubit.signIn(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.invalidEmail.code,
              ),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn user-disabled code return Failure.general',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.signIn(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(
                    message: FirebaseAuthError.userDisabled.code,
                  ),
                ),
              );
            },
            act: (_) {
              cubit.signIn(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.userDisabled.code,
              ),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn user-not-found code return Failure.general',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.signIn(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(
                    message: FirebaseAuthError.userNotFound.code,
                  ),
                ),
              );
            },
            act: (_) {
              cubit.signIn(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.userNotFound.code,
              ),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn wrong-password code return Failure.general',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.signIn(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(
                    message: FirebaseAuthError.wrongPassword.code,
                  ),
                ),
              );
            },
            act: (_) {
              cubit.signIn(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.wrongPassword.code,
              ),
            ],
          );
        },
      );
    },
  );
}
