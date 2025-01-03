import 'package:flutter/material.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/widgets/shopping_container_item/shopping_container_item.dart';

class ShoppintListContainers extends StatelessWidget {
  const ShoppintListContainers(
      {required this.shoppingListContainers, super.key});

  final List<ShoppingListContainer> shoppingListContainers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppingListContainers.length,
      itemBuilder: (context, index) {
        final shoppingListContainer = shoppingListContainers[index];
        return ShoppingContainerItem(
          shoppingListContainer: shoppingListContainer,
        );
      },
    );
  }
}
