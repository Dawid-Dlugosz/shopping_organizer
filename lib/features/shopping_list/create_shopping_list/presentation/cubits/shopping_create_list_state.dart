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
    bool? error,
  }) = _Created;

  List<ShoppingListItem> get shoppingListItems => maybeMap(
        created: (value) => value
            .shoppingListContainer.shoppingListItemCollection.shoppingListItems,
        orElse: () => [],
      );

  ShoppingItemCollection? get shoppingListItemCollection => maybeMap(
        created: (value) =>
            value.shoppingListContainer.shoppingListItemCollection,
        orElse: () => null,
      );

  ShoppingListContainer? get shoppingListContainer => maybeMap(
        created: (value) => value.shoppingListContainer,
        orElse: () => null,
      );
}
