import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this.firebaseAuth,
    this.googleSignIn,
    this.facebookAuth,
  );

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookAuth;
  final Logger _logger = Logger();

  @override
  Future<Either<Failure, UserCredential>> login({
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
  Future<Either<Failure, UserCredential>> createAccount({
    required String email,
    required String password,
    required String nickname,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userCredential.user?.updateProfile(displayName: nickname);

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

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<Stream<User?>> sessionListener() async {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<Either<Failure, UserCredential?>> loginViaGoogle() async {
    try {
      final googleAccount = await googleSignIn.signIn();
      final googleAuth = await googleAccount?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        final userCredential =
            await firebaseAuth.signInWithCredential(credential);
        return Right(userCredential);
      }
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.code));
    } catch (e, s) {
      _logger.e(
        'AuthRepositoryImpl loginViaGoogle',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.general());
    }
  }

  @override
  Future<Either<Failure, UserCredential?>> loginViaFacebook() async {
    try {
      final LoginResult loginResult = await facebookAuth.login();
      if (loginResult.accessToken != null) {
        final facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        final credential =
            await firebaseAuth.signInWithCredential(facebookAuthCredential);

        return Right(credential);
      }
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.code));
    } catch (e, s) {
      _logger.e(
        'AuthRepositoryImpl loginViaFacebook',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.general());
    }
  }
}
