import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

import 'package:shopping_organizer/core/enums/firestore_collection_type.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/domain/repositories/custom_user_repository.dart';

@LazySingleton(as: CustomUserRepository)
class CustomUserRepositoryImpl implements CustomUserRepository {
  CustomUserRepositoryImpl(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;
  final Logger _logger = Logger();

  @override
  Future<Either<Failure, Unit>> createCustomUser({
    required CustomUser customUser,
  }) async {
    try {
      firebaseFirestore
          .collection(FirestoreCollectionType.users.type)
          .doc(customUser.userId)
          .set(
            customUser.toJson(),
          );

      return const Right(unit);
    } catch (e, s) {
      _logger.e(
        'CustomUserRepositoryImpl createCustomUser',
        error: e,
        stackTrace: s,
      );

      return const Left(
        Failure.general(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateFCMToken({
    required String userId,
    required String fcmToken,
  }) async {
    try {
      firebaseFirestore
          .collection(FirestoreCollectionType.users.type)
          .doc(userId)
          .update(
        {
          'fcmToken': fcmToken,
        },
      );
      return right(unit);
    } catch (e, s) {
      _logger.e(
        'CustomUserRepositoryImpl updatePhoneId',
        error: e,
        stackTrace: s,
      );
      return const Left(Failure.general());
    }
  }

  @override
  Future<Either<Failure, CustomUser>> getCustomUser({
    required String userId,
  }) async {
    try {
      final documentSnapshot = await firebaseFirestore
          .collection(FirestoreCollectionType.users.type)
          .doc(userId)
          .get();

      final documentBody = documentSnapshot.data();

      if (documentBody != null) {
        return right(CustomUser.fromJson(documentBody));
      } else {
        throw Exception('Empty body');
      }
    } catch (e, s) {
      _logger.e(
        'CustomUserRepositoryImpl getCustomUser',
        error: e,
        stackTrace: s,
      );

      return left(const Failure.general());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateShoppingList({
    required List<String> shoppingList,
    required String userId,
  }) async {
    try {
      await firebaseFirestore
          .collection(FirestoreCollectionType.users.type)
          .doc(userId)
          .update({
        'shoppingLists': shoppingList,
      });

      return const Right(unit);
    } catch (e, s) {
      _logger.e(
        'CustomUserRepositoryImpl getCustomUser',
        error: e,
        stackTrace: s,
      );

      return const Left(Failure.general());
    }
  }
}
