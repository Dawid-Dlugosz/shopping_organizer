import 'package:flutter/material.dart';
import 'package:shopping_organizer/core/color_extension.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_item_collection.dart';

class CheckedCountWidget extends StatelessWidget {
  const CheckedCountWidget({
    required this.shoppingItemCollection,
    super.key,
  });

  final ShoppingItemCollection shoppingItemCollection;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Text(
            '${shoppingItemCollection.checkedItemsLength} / ${shoppingItemCollection.shoppingListItems.length}'),
        Icon(
          Icons.check,
          color: Theme.of(context).extension<ColorExtension>()!.accentColor,
        ),
      ],
    );
  }
}
