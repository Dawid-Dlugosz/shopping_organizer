import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item.dart';

part 'shopping_list_item_collection.freezed.dart';
part 'shopping_list_item_collection.g.dart';

@freezed
class ShoppingListItemCollection with _$ShoppingListItemCollection {
  const ShoppingListItemCollection._();

  @JsonSerializable(explicitToJson: true)
  const factory ShoppingListItemCollection({
    required List<ShoppingListItem> shoppingListItems,
  }) = _ShoppingListItemCollection;

  factory ShoppingListItemCollection.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListItemCollectionFromJson(json);

  ShoppingListItemCollection add(ShoppingListItem shoppingListItem) {
    return (copyWith(
      shoppingListItems: [...shoppingListItems, shoppingListItem],
    ));
  }

  ShoppingListItemCollection remove(int index) {
    return copyWith(
        shoppingListItems: List.unmodifiable(
            shoppingListItems.sublist(0, index) +
                shoppingListItems.sublist(index + 1)));
  }

  ShoppingListItemCollection updateItem({
    required ShoppingListItem shoppingListItem,
    required int index,
  }) {
    return copyWith(
        shoppingListItems: List.unmodifiable(shoppingListItems.sublist(0, index)
          ..add(shoppingListItem)
          ..addAll(shoppingListItems.sublist(index + 1))));
  }

  ShoppingListItemCollection updateCollection(
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
