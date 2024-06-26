import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserCredential>> signOn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<Stream<User?>> sessionListener();
}
