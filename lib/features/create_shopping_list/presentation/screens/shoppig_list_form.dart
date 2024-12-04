import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_organizer/core/entities%20/shopping_list_item_controllers.dart';
import 'package:uuid/uuid.dart';

import 'package:shopping_organizer/core/screens/loading_screen.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/cubits/shopping_list_cubit.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/widgets/shopping_form.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class ShoppingListForm extends StatefulWidget {
  const ShoppingListForm({super.key});

  @override
  State<ShoppingListForm> createState() => _ShoppingListFormState();
}

class _ShoppingListFormState extends State<ShoppingListForm> {
  late final List<ShoppingListItemControllers> _shoppingListItemControllers;

  @override
  void initState() {
    _shoppingListItemControllers = <ShoppingListItemControllers>[];
    _shoppingListItemControllers.add(
      ShoppingListItemControllers(
        imagePicker: ImagePicker(),
        nameController: TextEditingController(),
        quantityController: TextEditingController(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uuid = getIt<Uuid>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.createShoppingList,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _shoppingListItemControllers.add(
                ShoppingListItemControllers(
                  imagePicker: ImagePicker(),
                  nameController: TextEditingController(),
                  quantityController: TextEditingController(),
                ),
              );
              final shoppingListItem = ShoppingListItem(
                id: uuid.v4(),
              );

              context
                  .read<ShoppingListCubit>()
                  .addShoppingListElement(shoppingListItem);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocConsumer<ShoppingListCubit, ShoppingListState>(
        listener: (context, state) {
          state.mapOrNull(
            loaded: (value) {
              if (value.error == false) {
                ScaffoldMessenger.of(context).clearSnackBars();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)!.unservicedError,
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            added: (value) => Navigator.pop(context, value.id),
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const LoadingScreen(),
            loaded: (_) => ShoppingForm(
              shoppingListItemControllers: _shoppingListItemControllers,
            ),
          );
        },
      ),
    );
  }
}
