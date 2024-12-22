part of 'shopping_list_cubit.dart';

@freezed
class ShoppingListState with _$ShoppingListState {
  const ShoppingListState._();

  const factory ShoppingListState.initial() = _Initial;
  const factory ShoppingListState.loading() = _Loading;
  const factory ShoppingListState.added(String id) = _Added;
  const factory ShoppingListState.loaded({
    required ShoppingListContainer shoppingListContainer,
    bool? error,
  }) = _Loaded;

  List<ShoppingListItem> get shoppingListItems => maybeMap(
        loaded: (value) => value
            .shoppingListContainer.shoppingListItemCollection.shoppingListItems,
        orElse: () => [],
      );

  ShoppingItemCollection? get shoppingListItemCollection => maybeMap(
        loaded: (value) =>
            value.shoppingListContainer.shoppingListItemCollection,
        orElse: () => null,
      );

  ShoppingListContainer? get shoppingListContainer => maybeMap(
        loaded: (value) => value.shoppingListContainer,
        orElse: () => null,
      );
}
