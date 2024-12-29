import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_item_collection.dart';

part 'shopping_list_container.freezed.dart';
part 'shopping_list_container.g.dart';

@freezed
class ShoppingListContainer with _$ShoppingListContainer {
  @JsonSerializable(explicitToJson: true)
  const factory ShoppingListContainer({
    required String ownerId,
    required String ownerNickname,
    required String id,
    required ShoppingItemCollection shoppingListItemCollection,
    String? name,
  }) = _ShoppingListContainer;

  factory ShoppingListContainer.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListContainerFromJson(json);
}
