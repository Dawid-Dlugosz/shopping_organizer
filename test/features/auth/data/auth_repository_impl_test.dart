import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:shopping_organizer/core/enums/firebase_auth_error.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/auth/data/repository/auth_repository_impl.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late AuthRepositoryImpl authRepositoryImpl;
  late MockFirebaseAuth firebaseAuth;
  late MockUserCredential userCredential;
  late MockUser user;

  setUp(() {
    user = MockUser();
    firebaseAuth = MockFirebaseAuth();
    userCredential = MockUserCredential();
    authRepositoryImpl = AuthRepositoryImpl(firebaseAuth);
  });

  group(
    'AuthRepositoryImpl',
    () {
      group(
        'sigiIn',
        () {
          test(
            'Should return UserCredential from firebase',
            () async {
              when(
                () => firebaseAuth.signInWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer(
                (_) async => userCredential,
              );

              // when(() => userCredential.user).thenReturn(user);

              final failureOrUserCredential = await authRepositoryImpl.signIn(
                email: 'email',
                password: 'password',
              );

              expect(failureOrUserCredential, Right(userCredential));
            },
          );

          test(
            'Should return Failure.auth with invalid-email code',
            () async {
              when(
                () => firebaseAuth.signInWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(
                FirebaseAuthException(
                  code: FirebaseAuthError.invalidEmail.code,
                ),
              );

              final failureOrUserCredential = await authRepositoryImpl.signIn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Left(
                  Failure.auth(
                    message: FirebaseAuthError.invalidEmail.code,
                  ),
                ),
              );
            },
          );

          test(
            'Should return Failure.auth with user-disabled code',
            () async {
              when(
                () => firebaseAuth.signInWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(
                FirebaseAuthException(
                  code: FirebaseAuthError.userDisabled.code,
                ),
              );

              final failureOrUserCredential = await authRepositoryImpl.signIn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Left(
                  Failure.auth(
                    message: FirebaseAuthError.userDisabled.code,
                  ),
                ),
              );
            },
          );

          test(
            'Should return Failure.auth with user-not-found code',
            () async {
              when(
                () => firebaseAuth.signInWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(
                FirebaseAuthException(
                  code: FirebaseAuthError.userNotFound.code,
                ),
              );

              final failureOrUserCredential = await authRepositoryImpl.signIn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Left(
                  Failure.auth(
                    message: FirebaseAuthError.userNotFound.code,
                  ),
                ),
              );
            },
          );

          test(
            'Should return Failure.auth with wrong-password code',
            () async {
              when(
                () => firebaseAuth.signInWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(
                FirebaseAuthException(
                  code: FirebaseAuthError.wrongPassword.code,
                ),
              );

              final failureOrUserCredential = await authRepositoryImpl.signIn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Left(
                  Failure.auth(
                    message: FirebaseAuthError.wrongPassword.code,
                  ),
                ),
              );
            },
          );

          test(
            'Should return Failure.general',
            () async {
              when(
                () => firebaseAuth.signInWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(Exception());

              final failureOrUserCredential = await authRepositoryImpl.signIn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                const Left(
                  Failure.general(),
                ),
              );
            },
          );
        },
      );

      group(
        'singOn',
        () {
          test(
            'Should return UserCredential from firebase',
            () async {
              when(
                () => firebaseAuth.createUserWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenAnswer((_) async => userCredential);

              when(() => userCredential.user).thenReturn(user);

              when(() => user.updateDisplayName(any())).thenAnswer(
                (_) async {},
              );

              final failureOrUserCredential = await authRepositoryImpl.signOn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Right(userCredential),
              );
            },
          );

          test(
            'Should return Failure.general from repository',
            () async {
              when(
                () => firebaseAuth.createUserWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(Exception());

              final failureOrUserCredential = await authRepositoryImpl.signOn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                const Left(
                  Failure.general(),
                ),
              );
            },
          );

          test(
            'Should return Failure.auth with email-already-in-use code from repository',
            () async {
              when(
                () => firebaseAuth.createUserWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(
                FirebaseAuthException(
                  code: FirebaseAuthError.emailAlreadyInUse.code,
                ),
              );

              final failureOrUserCredential = await authRepositoryImpl.signOn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Left(
                  Failure.auth(
                    message: FirebaseAuthError.emailAlreadyInUse.code,
                  ),
                ),
              );
            },
          );

          test(
            'Should return Failure.auth with invalid-email code from repository',
            () async {
              when(
                () => firebaseAuth.createUserWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(
                FirebaseAuthException(
                  code: FirebaseAuthError.invalidEmail.code,
                ),
              );

              final failureOrUserCredential = await authRepositoryImpl.signOn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Left(
                  Failure.auth(
                    message: FirebaseAuthError.invalidEmail.code,
                  ),
                ),
              );
            },
          );

          test(
            'Should return Failure.auth with weak-password code from repository',
            () async {
              when(
                () => firebaseAuth.createUserWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                ),
              ).thenThrow(
                FirebaseAuthException(
                  code: FirebaseAuthError.weakPassword.code,
                ),
              );

              final failureOrUserCredential = await authRepositoryImpl.signOn(
                email: 'email',
                password: 'password',
              );

              expect(
                failureOrUserCredential,
                Left(
                  Failure.auth(
                    message: FirebaseAuthError.weakPassword.code,
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
