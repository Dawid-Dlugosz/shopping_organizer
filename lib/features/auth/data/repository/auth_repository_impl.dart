import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;
  final Logger _logger = Logger();

  @override
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.code));
    } catch (e, s) {
      _logger.e(
        'AuthRepositoryImpl siginIn',
        error: e,
        stackTrace: s,
      );

      return const Left(Failure.general());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signOn({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(displayName);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.code));
    } catch (e, s) {
      _logger.e(
        'AuthRepositoryImpl signOn',
        error: e,
        stackTrace: s,
      );

      return const Left(Failure.general());
    }
  }
}
