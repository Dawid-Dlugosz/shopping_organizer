import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shopping_organizer/core/color_extension.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/cubits/shopping_create_list_cubit.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({
    required this.shoppingListItem,
    required this.index,
    super.key,
  });

  final ShoppingListItem shoppingListItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Hero(
            tag: shoppingListItem.localImagePath!,
            child: Image.file(
              fit: BoxFit.cover,
              File(
                shoppingListItem.localImagePath!,
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2.0,
            sigmaY: 2.0,
          ),
          child: ColoredBox(
            color: Theme.of(context)
                .extension<ColorExtension>()!
                .mainDark
                .withAlpha(120),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      final shoppingListCubit =
                          context.read<ShoppingCreateListCubit>();
                      shoppingListCubit.addImageToItem(
                        index: index,
                        path: null,
                      );
                    },
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.delete,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
