import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shopping_organizer/core/entities%20/shopping_item_controllers.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/cubits/shopping_list_cubit.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/widgets/image_picker_widget.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({
    required this.shoppingItemControllers,
    required this.index,
    required this.shoppingListItem,
    super.key,
  });

  final ShoppingItemControllers shoppingItemControllers;
  final int index;
  final ShoppingListItem shoppingListItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 20,
          children: [
            Expanded(
              child: Column(
                spacing: 10,
                children: [
                  TextFormField(
                    controller: shoppingItemControllers.nameController,
                    decoration: InputDecoration(
                      label: Text(AppLocalizations.of(context)!.name),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.enterName;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: shoppingItemControllers.quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(AppLocalizations.of(context)!.quantity),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.enterName;
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      isDense: false,
                    ),
                    isExpanded: true,
                    value: shoppingListItem.countType.value,
                    items: CountType.values
                        .map<DropdownMenuItem<String>>((CountType value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(
                          value.name,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      final shoppingListCubit =
                          context.read<ShoppingListCubit>();

                      shoppingListCubit.updateCountType(
                        index: index,
                        countType: CountType.values
                            .firstWhere((element) => element.value == value),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              width: 120,
              child: ImagePickerWidget(
                shoppingItemControllers: shoppingItemControllers,
                shoppingListItem: shoppingListItem,
                index: index,
              ),
            )
          ],
        ),
      ),
    );
  }
}
