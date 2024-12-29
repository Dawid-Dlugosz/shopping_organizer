import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shopping_organizer/core/entities%20/shopping_item_controllers.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/cubits/shopping_create_list_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/widgets/shopping_card.dart';

class ShoppingForm extends StatefulWidget {
  const ShoppingForm({
    required List<ShoppingItemControllers> shoppingItemControllers,
    super.key,
  }) : _shoppingItemControllers = shoppingItemControllers;

  final List<ShoppingItemControllers> _shoppingItemControllers;

  @override
  State<ShoppingForm> createState() => _ShoppingFormState();
}

class _ShoppingFormState extends State<ShoppingForm> {
  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: Text(
                        AppLocalizations.of(context)!.shoppingListName,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.enterName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: context
                          .watch<ShoppingCreateListCubit>()
                          .state
                          .shoppingListItems
                          .length,
                      itemBuilder: (ctx, index) {
                        return ShoppingCard(
                          index: index,
                          shoppingItemControllers:
                              widget._shoppingItemControllers[index],
                          shoppingListItem: context
                              .watch<ShoppingCreateListCubit>()
                              .state
                              .shoppingListItems[index],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 10,
            ),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancel),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ShoppingCreateListCubit>().createShopList(
                            shoppingItemControllers:
                                widget._shoppingItemControllers,
                            name: _nameController.text,
                          );
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!.enterRequiredFields,
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.save),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
