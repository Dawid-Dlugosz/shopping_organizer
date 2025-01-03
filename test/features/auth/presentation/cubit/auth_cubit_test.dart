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

    cubit = AuthCubit(
      authRepository,
    );
  });

  group(
    'AuthCubit',
    () {
      test(
        'Should emit [UnAuthorized] as a first state',
        () {
          expect(cubit.state, const AuthState.unAuthorized());
        },
      );

      group(
        'login',
        () {
          blocTest(
            'Shoule emit [Authorized] when repo return UserCredential',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.login(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer((_) async => Right(userCredential));

              when(() => userCredential.user).thenReturn(user);
            },
            act: (_) {
              cubit.login(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              const AuthState.loading(),
              AuthState.authorized(
                user: user,
              ),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn null code return Failure.general',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.login(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer((_) async => const Left(Failure.general()));
            },
            act: (_) {
              cubit.login(
                email: 'email',
                password: 'password',
              );
            },
            skip: 1,
            expect: () => [
              const AuthState.error(),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn invalid-email code return Failure',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.login(
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
              cubit.login(
                email: 'email',
                password: 'password',
              );
            },
            skip: 1,
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.invalidEmail.code,
              ),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn user-disabled code return Failure',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.login(
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
              cubit.login(
                email: 'email',
                password: 'password',
              );
            },
            skip: 1,
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.userDisabled.code,
              ),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn user-not-found code return Failure',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.login(
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
              cubit.login(
                email: 'email',
                password: 'password',
              );
            },
            skip: 1,
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.userNotFound.code,
              ),
            ],
          );

          blocTest(
            'Shoule emit [Error] witn wrong-password code return Failure',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.login(
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
            skip: 1,
            act: (_) {
              cubit.login(
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

          blocTest(
            'Shoule emit [unAuthorized, Error] witn wrong-password code return Failure an current state is error',
            build: () => cubit,
            seed: () => AuthState.error(
              code: FirebaseAuthError.wrongPassword.code,
            ),
            setUp: () {
              when(
                () => authRepository.login(
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
              cubit.login(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              const AuthState.loading(),
              AuthState.error(
                code: FirebaseAuthError.wrongPassword.code,
              ),
            ],
          );
          blocTest(
            'Shoule emit [unAuthorized, Error] witn invalid-email code return Failure an current state is error',
            build: () => cubit,
            seed: () => AuthState.error(
              code: FirebaseAuthError.wrongPassword.code,
            ),
            setUp: () {
              when(
                () => authRepository.login(
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
              cubit.login(
                email: 'email',
                password: 'password',
              );
            },
            expect: () => [
              const AuthState.loading(),
              AuthState.error(
                code: FirebaseAuthError.invalidEmail.code,
              ),
            ],
          );
        },
      );

      group(
        'createAccount',
        () {
          blocTest(
            'Should emit [Authorized] when repo return UserCredential',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  nickname: any(named: 'nickname'),
                ),
              ).thenAnswer((_) async => Right(userCredential.user!));

              when(() => user.uid).thenReturn('asdsdasd');

              when(() => userCredential.user).thenReturn(user);
            },
            act: (_) {
              cubit.createAccount(
                email: 'email',
                password: 'password',
                nickname: 'nickname',
              );
            },
            skip: 1,
            expect: () => [
              AuthState.authorized(user: user),
            ],
          );

          blocTest(
            'Should emit [Error] with email-already-in-use code when repo return Failure',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  nickname: any(named: 'nickname'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(
                    message: FirebaseAuthError.emailAlreadyInUse.code,
                  ),
                ),
              );
            },
            act: (_) {
              cubit.createAccount(
                email: 'email',
                password: 'password',
                nickname: 'nickname',
              );
            },
            skip: 1,
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.emailAlreadyInUse.code,
              ),
            ],
          );

          blocTest(
            'Should emit [Error] with invalid-email code when repo return Failure',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  nickname: any(named: 'nickname'),
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
              cubit.createAccount(
                email: 'email',
                password: 'password',
                nickname: 'nickname',
              );
            },
            skip: 1,
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.invalidEmail.code,
              ),
            ],
          );

          blocTest(
            'Should emit [Error] with weak-password code when repo return Failure',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  nickname: any(named: 'nickname'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(
                    message: FirebaseAuthError.weakPassword.code,
                  ),
                ),
              );
            },
            act: (_) {
              cubit.createAccount(
                email: 'email',
                password: 'password',
                nickname: 'nickname',
              );
            },
            skip: 1,
            expect: () => [
              AuthState.error(
                code: FirebaseAuthError.weakPassword.code,
              ),
            ],
          );

          blocTest(
            'Should emit [Error] with weak-password code when repo return Failure and current state is Error weak-password',
            build: () => cubit,
            seed: () => AuthState.error(
              code: FirebaseAuthError.weakPassword.code,
            ),
            setUp: () {
              when(
                () => authRepository.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  nickname: any(named: 'nickname'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(message: FirebaseAuthError.weakPassword.code),
                ),
              );
            },
            act: (_) {
              cubit.createAccount(
                email: 'email',
                password: 'password',
                nickname: 'nickname',
              );
            },
            expect: () => [
              const AuthState.loading(),
              AuthState.error(
                code: FirebaseAuthError.weakPassword.code,
              ),
            ],
          );

          blocTest(
            'Should emit [Error] with weak-password code when repo return Failure and current state is Error invalid-email',
            build: () => cubit,
            seed: () => AuthState.error(
              code: FirebaseAuthError.invalidEmail.code,
            ),
            setUp: () {
              when(
                () => authRepository.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  nickname: any(named: 'nickname'),
                ),
              ).thenAnswer(
                (_) async => Left(
                  Failure.auth(message: FirebaseAuthError.weakPassword.code),
                ),
              );
            },
            act: (_) {
              cubit.createAccount(
                email: 'email',
                password: 'password',
                nickname: 'nickname',
              );
            },
            expect: () => [
              const AuthState.loading(),
              AuthState.error(
                code: FirebaseAuthError.weakPassword.code,
              ),
            ],
          );

          blocTest(
            'Should emit [Error] with null code when repo return Failure.general',
            build: () => cubit,
            setUp: () {
              when(
                () => authRepository.createAccount(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  nickname: any(named: 'nickname'),
                ),
              ).thenAnswer(
                (_) async => const Left(
                  Failure.general(),
                ),
              );
            },
            act: (_) {
              cubit.createAccount(
                email: 'email',
                password: 'password',
                nickname: 'nickname',
              );
            },
            skip: 1,
            expect: () => [
              const AuthState.error(),
            ],
          );
        },
      );
      group('loginViaGoogle', () {
        blocTest(
          'Should emit [Authorized] with user',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer(
              (_) async => Right(userCredential),
            );

            when(() => userCredential.user).thenReturn(user);
          },
          act: (_) {
            cubit.loginViaGoogle();
          },
          skip: 1,
          expect: () => [
            AuthState.authorized(user: user),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn null code return Failure.general',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer((_) async => const Left(Failure.general()));
          },
          act: (_) {
            cubit.loginViaGoogle();
          },
          skip: 1,
          expect: () => [
            const AuthState.error(),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn invalid-email code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.invalidEmail.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaGoogle();
          },
          skip: 1,
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.invalidEmail.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn user-disabled code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.userDisabled.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaGoogle();
          },
          skip: 1,
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.userDisabled.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn user-not-found code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.userNotFound.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaGoogle();
          },
          skip: 1,
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.userNotFound.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn wrong-password code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.wrongPassword.code,
                ),
              ),
            );
          },
          skip: 1,
          act: (_) {
            cubit.loginViaGoogle();
          },
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.wrongPassword.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [unAuthorized, Error] witn wrong-password code return Failure an current state is error',
          build: () => cubit,
          seed: () => AuthState.error(
            code: FirebaseAuthError.wrongPassword.code,
          ),
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.wrongPassword.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaGoogle();
          },
          expect: () => [
            const AuthState.loading(),
            AuthState.error(
              code: FirebaseAuthError.wrongPassword.code,
            ),
          ],
        );
        blocTest(
          'Shoule emit [unAuthorized, Error] witn invalid-email code return Failure an current state is error',
          build: () => cubit,
          seed: () => AuthState.error(
            code: FirebaseAuthError.wrongPassword.code,
          ),
          setUp: () {
            when(
              () => authRepository.loginViaGoogle(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.invalidEmail.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaGoogle();
          },
          expect: () => [
            const AuthState.loading(),
            AuthState.error(
              code: FirebaseAuthError.invalidEmail.code,
            ),
          ],
        );
      });

      group('loginViaFacebook', () {
        blocTest(
          'Should emit [Authorized] with user',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer(
              (_) async => Right(userCredential),
            );

            when(() => userCredential.user).thenReturn(user);
          },
          act: (_) {
            cubit.loginViaFacebook();
          },
          skip: 1,
          expect: () => [
            AuthState.authorized(user: user),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn null code return Failure.general',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer((_) async => const Left(Failure.general()));
          },
          act: (_) {
            cubit.loginViaFacebook();
          },
          skip: 1,
          expect: () => [
            const AuthState.error(),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn invalid-email code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.invalidEmail.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaFacebook();
          },
          skip: 1,
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.invalidEmail.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn user-disabled code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.userDisabled.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaFacebook();
          },
          skip: 1,
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.userDisabled.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn user-not-found code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.userNotFound.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaFacebook();
          },
          skip: 1,
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.userNotFound.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [Error] witn wrong-password code return Failure',
          build: () => cubit,
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.wrongPassword.code,
                ),
              ),
            );
          },
          skip: 1,
          act: (_) {
            cubit.loginViaFacebook();
          },
          expect: () => [
            AuthState.error(
              code: FirebaseAuthError.wrongPassword.code,
            ),
          ],
        );

        blocTest(
          'Shoule emit [unAuthorized, Error] witn wrong-password code return Failure an current state is error',
          build: () => cubit,
          seed: () => AuthState.error(
            code: FirebaseAuthError.wrongPassword.code,
          ),
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.wrongPassword.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaFacebook();
          },
          expect: () => [
            const AuthState.loading(),
            AuthState.error(
              code: FirebaseAuthError.wrongPassword.code,
            ),
          ],
        );
        blocTest(
          'Shoule emit [unAuthorized, Error] witn invalid-email code return Failure an current state is error',
          build: () => cubit,
          seed: () => AuthState.error(
            code: FirebaseAuthError.wrongPassword.code,
          ),
          setUp: () {
            when(
              () => authRepository.loginViaFacebook(),
            ).thenAnswer(
              (_) async => Left(
                Failure.auth(
                  message: FirebaseAuthError.invalidEmail.code,
                ),
              ),
            );
          },
          act: (_) {
            cubit.loginViaFacebook();
          },
          expect: () => [
            const AuthState.loading(),
            AuthState.error(
              code: FirebaseAuthError.invalidEmail.code,
            ),
          ],
        );
      });
    },
  );
}
