import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'shopping_item_controllers.freezed.dart';

@freezed
class ShoppingItemControllers with _$ShoppingItemControllers {
  const factory ShoppingItemControllers({
    required TextEditingController nameController,
    required TextEditingController quantityController,
    required ImagePicker imagePicker,
    String? imageLocalPath,
  }) = _ShoppingItemControllers;
}
