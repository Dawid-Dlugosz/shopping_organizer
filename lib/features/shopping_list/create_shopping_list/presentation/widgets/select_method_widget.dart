import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopping_organizer/core/entities%20/shopping_item_controllers.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/cubits/shopping_create_list_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/widgets/image_select_widget.dart';

class SelectMethod extends StatelessWidget {
  const SelectMethod({
    required this.index,
    required this.shoppingItemControllers,
    super.key,
  });

  final int index;
  final ShoppingItemControllers shoppingItemControllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ImageSelect(
            iconData: Icons.image,
            onTap: () async {
              final shoppingListCubit = context.read<ShoppingCreateListCubit>();
              final image = await shoppingItemControllers.imagePicker.pickImage(
                source: ImageSource.gallery,
              );
              if (image == null) {
                return;
              }

              shoppingListCubit.addImageToItem(
                index: index,
                path: image.path,
              );
            },
          ),
        ),
        Expanded(
          child: ImageSelect(
            iconData: Icons.camera,
            onTap: () async {
              final shoppingListCubit = context.read<ShoppingCreateListCubit>();
              final image = await shoppingItemControllers.imagePicker.pickImage(
                source: ImageSource.camera,
              );

              if (image == null) {
                return;
              }

              shoppingListCubit.addImageToItem(
                index: index,
                path: image.path,
              );
            },
          ),
        ),
      ],
    );
  }
}
