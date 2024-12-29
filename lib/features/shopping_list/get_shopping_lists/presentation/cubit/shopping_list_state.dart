part of 'shopping_list_cubit.dart';

@freezed
class ShoppingListState with _$ShoppingListState {
  const factory ShoppingListState.initial() = _Initial;
  const factory ShoppingListState.loaded(
    List<ShoppingListContainer> shoppingListContainers,
  ) = _Loaded;
  const factory ShoppingListState.loading() = _Loading;
  const factory ShoppingListState.error() = _Error;
}
