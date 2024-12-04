import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_container.dart';

abstract class ShoppingListRepository {
  Future<Either<Failure, String>> createShoppingList(
    ShoppingListContainer shoppingListContainer,
  );
  Future<Either<Failure, ShoppingListContainer>> getShoppingList();
}
