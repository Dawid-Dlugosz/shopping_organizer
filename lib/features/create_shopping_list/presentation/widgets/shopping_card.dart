import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopping_organizer/core/entities%20/shopping_list_item_controllers.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/cubits/shopping_list_cubit.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({
    required this.shoppingListItemControllers,
    required this.index,
    super.key,
  });

  final ShoppingListItemControllers shoppingListItemControllers;
  final int index;

  @override
  Widget build(BuildContext context) {
    final shoppingLisItem =
        context.watch<ShoppingListCubit>().state.shoppingListItems[index];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: shoppingListItemControllers.nameController,
                    decoration: InputDecoration(
                      label: Text(AppLocalizations.of(context)!.name),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.enterName;
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller:
                              shoppingListItemControllers.quantityController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(AppLocalizations.of(context)!.quantity),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.enterName;
                            }
                            return null;
                          },
                        ),
                      ),
                      DropdownButton(
                        value: shoppingLisItem.countType.value,
                        items: CountType.values
                            .map<DropdownMenuItem<String>>((CountType value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          final shoppingListCubit =
                              context.read<ShoppingListCubit>();

                          shoppingListCubit.updateCountType(
                            index: index,
                            countType: CountType.values.firstWhere(
                                (element) => element.value == value),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    final shoppingListCubit = context.read<ShoppingListCubit>();
                    final image =
                        await shoppingListItemControllers.imagePicker.pickImage(
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
                  child: shoppingLisItem.localImagePath == null
                      ? Container(
                          color: Colors.amber,
                          width: 100,
                          height: 100,
                          child: const Center(
                            child: Text(
                              'Wybierz zdjęcie z albumu',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Image.file(
                          width: 120,
                          File(shoppingLisItem.localImagePath!),
                        ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final shoppingListCubit =
                            context.read<ShoppingListCubit>();
                        final image = await shoppingListItemControllers
                            .imagePicker
                            .pickImage(
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
                      icon: const Icon(Icons.camera_enhance),
                    ),
                    shoppingLisItem.localImagePath != null
                        ? ElevatedButton(
                            onPressed: () {
                              final shoppingListCubit =
                                  context.read<ShoppingListCubit>();

                              shoppingListCubit.addImageToItem(
                                index: index,
                                path: null,
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.clear,
                            ),
                          )
                        : const SizedBox()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
