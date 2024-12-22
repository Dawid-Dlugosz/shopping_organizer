import 'package:flutter/material.dart';

import 'package:shopping_organizer/core/color_extension.dart';
import 'package:shopping_organizer/core/entities%20/shopping_item_controllers.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/widgets/select_image_widget.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/widgets/select_method_widget.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    required this.shoppingItemControllers,
    required this.index,
    required this.shoppingListItem,
    super.key,
  });

  final ShoppingItemControllers shoppingItemControllers;
  final ShoppingListItem shoppingListItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).extension<ColorExtension>()!.accentColor,
        ),
      ),
      child: shoppingListItem.localImagePath != null
          ? SelectedImage(
              shoppingListItem: shoppingListItem,
              index: index,
            )
          : SelectMethod(
              shoppingItemControllers: shoppingItemControllers,
              index: index,
            ),
    );
  }
}
