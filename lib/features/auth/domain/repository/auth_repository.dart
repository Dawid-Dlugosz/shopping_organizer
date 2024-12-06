import 'package:firebase_auth/firebase_auth.dart';

import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserCredential?>> loginViaGoogle();

  Future<Either<Failure, UserCredential?>> loginViaFacebook();

  Future<Either<Failure, UserCredential>> createAccount({
    required String email,
    required String password,
    required String nickname,
  });

  Future<void> signOut();

  Future<Stream<User?>> sessionListener();
}
