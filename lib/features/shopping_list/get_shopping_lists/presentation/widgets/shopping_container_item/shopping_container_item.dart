import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_organizer/core/color_extension.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/widgets/shopping_container_item/checked_count_widget.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/widgets/shopping_container_item/date_widget.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/widgets/shopping_container_item/owner_name_widget.dart';

class ShoppingContainerItem extends StatelessWidget {
  const ShoppingContainerItem({required this.shoppingListContainer, super.key});

  final ShoppingListContainer shoppingListContainer;

  @override
  Widget build(BuildContext context) {
    final uid = context.read<CustomUserCubit>().state.customUser?.userId;
    final accentColor =
        Theme.of(context).extension<ColorExtension>()!.accentColor;

    return Card(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        splashColor: accentColor.withAlpha(10),
        highlightColor: accentColor.withAlpha(10),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shoppingListContainer.name!,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  if (shoppingListContainer.ownerId != uid)
                    OwnerNameWidget(
                      ownerName: shoppingListContainer.ownerNickname,
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateWidget(
                    timestamp: shoppingListContainer.createTimestamp,
                  ),
                  CheckedCountWidget(
                    shoppingItemCollection:
                        shoppingListContainer.shoppingItemCollection,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
