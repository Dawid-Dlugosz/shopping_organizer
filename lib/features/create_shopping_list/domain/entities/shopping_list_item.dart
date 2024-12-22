import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_list_item.freezed.dart';
part 'shopping_list_item.g.dart';

enum CountType {
  @JsonValue('piece')
  piece('piece'),
  @JsonValue('package')
  package('package'),
  @JsonValue('grams')
  grams('grams'),
  @JsonValue('kilograms')
  kilograms('kilograms');

  const CountType(this.value);

  final String value;
}

@freezed
class ShoppingListItem with _$ShoppingListItem {
  const ShoppingListItem._();

  const factory ShoppingListItem({
    required String id,
    String? name,
    String? quantity,
    @Default(CountType.piece) CountType countType,
    String? networkImagePath,
    @JsonKey(includeFromJson: false) String? localImagePath,
    @Default(false) bool isBought,
  }) = _ShoppingListItem;

  ShoppingListItem updateImagePaths({
    String? localPath,
    required String containerId,
  }) {
    String? networkImagePath = localPath != null ? '$containerId/$id' : null;

    return copyWith(
      localImagePath: localPath,
      networkImagePath: networkImagePath,
    );
  }

  ShoppingListItem updateCountType(CountType countType) {
    return copyWith(countType: countType);
  }

  ShoppingListItem updateNameAndQuantity({
    required String name,
    required String quantity,
  }) {
    return copyWith(
      name: name,
      quantity: quantity,
    );
  }

  factory ShoppingListItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListItemFromJson(json);
}
