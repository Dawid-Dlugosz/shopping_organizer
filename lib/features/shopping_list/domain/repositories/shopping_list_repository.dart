import 'package:fpdart/fpdart.dart';

import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';

abstract class ShoppingListRepository {
  Future<Either<Failure, String>> createShoppingList(
    ShoppingListContainer shoppingListContainer,
  );

  Future<Either<Failure, List<ShoppingListContainer>>> getShoppingList(
    List<String> idLists,
  );
}
