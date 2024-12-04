import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'shopping_list_item_controllers.freezed.dart';

@freezed
class ShoppingListItemControllers with _$ShoppingListItemControllers {
  const factory ShoppingListItemControllers({
    required TextEditingController nameController,
    required TextEditingController quantityController,
    required ImagePicker imagePicker,
    String? imageLocalPath,
  }) = _ShoppingListItemControllers;
}
