import 'package:fpdart/fpdart.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';

abstract class CustomUserRepository {
  Future<Either<Failure, Unit>> createCustomUser({
    required CustomUser customUser,
  });

  Future<Either<Failure, Unit>> updateFCMToken({
    required String userId,
    required String fcmToken,
  });

  Future<Either<Failure, CustomUser>> getCustomUser({
    required String userId,
  });

  Future<Either<Failure, Unit>> updateShoppingList({
    required List<String> shoppingList,
    required String userId,
  });
}
