part of 'shopping_create_list_cubit.dart';

@freezed
class ShoppingCreateListState with _$ShoppingCreateListState {
  const ShoppingCreateListState._();

  const factory ShoppingCreateListState.initial() = _Initial;
  const factory ShoppingCreateListState.loading() = _Loading;
  const factory ShoppingCreateListState.added({
    required ShoppingListContainer shoppingListContainer,
  }) = _Added;
  const factory ShoppingCreateListState.created({
    required ShoppingListContainer shoppingListContainer,
  }) = _Created;
  const factory ShoppingCreateListState.error() = _Error;

  List<ShoppingListItem> get shoppingListItems => maybeMap(
        created: (value) => value
            .shoppingListContainer.shoppingItemCollection.shoppingListItems,
        orElse: () => [],
      );

  ShoppingItemCollection? get shoppingItemCollection => maybeMap(
        created: (value) => value.shoppingListContainer.shoppingItemCollection,
        orElse: () => null,
      );

  ShoppingListContainer? get shoppingListContainer => maybeMap(
        created: (value) => value.shoppingListContainer,
        orElse: () => null,
      );
}
