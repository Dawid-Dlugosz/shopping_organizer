import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item.dart';

part 'shopping_item_collection.freezed.dart';
part 'shopping_item_collection.g.dart';

@freezed
class ShoppingItemCollection with _$ShoppingItemCollection {
  const ShoppingItemCollection._();

  @JsonSerializable(explicitToJson: true)
  const factory ShoppingItemCollection({
    required List<ShoppingListItem> shoppingListItems,
  }) = _ShoppingItemCollection;

  factory ShoppingItemCollection.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemCollectionFromJson(json);

  ShoppingItemCollection add(ShoppingListItem shoppingListItem) {
    return (copyWith(
      shoppingListItems: [...shoppingListItems, shoppingListItem],
    ));
  }

  ShoppingItemCollection remove(int index) {
    return copyWith(
        shoppingListItems: List.unmodifiable(
            shoppingListItems.sublist(0, index) +
                shoppingListItems.sublist(index + 1)));
  }

  ShoppingItemCollection updateItem({
    required ShoppingListItem shoppingListItem,
    required int index,
  }) {
    return copyWith(
        shoppingListItems: List.unmodifiable(shoppingListItems.sublist(0, index)
          ..add(shoppingListItem)
          ..addAll(shoppingListItems.sublist(index + 1))));
  }

  ShoppingItemCollection updateCollection(
    List<ShoppingListItem> shoppingListItemss,
  ) {
    return copyWith(
      shoppingListItems: shoppingListItemss,
    );
  }

  bool get isAnyImage =>
      shoppingListItems.any((element) => element.localImagePath != null);

  List<ShoppingListItem> get shoppingListItemsWithImage => shoppingListItems
      .where((element) => element.localImagePath != null)
      .toList();
}
