import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_organizer/core/entities%20/shopping_item_controllers.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:uuid/uuid.dart';

import 'package:shopping_organizer/core/screens/loading_screen.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/cubits/shopping_create_list_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/widgets/shopping_form.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class ShoppingCreatePage extends StatefulWidget {
  const ShoppingCreatePage({super.key});

  @override
  State<ShoppingCreatePage> createState() => _ShoppingCreatePageState();
}

class _ShoppingCreatePageState extends State<ShoppingCreatePage> {
  late final List<ShoppingItemControllers> _shoppingItemControllers;
  late final Uuid _uuid;

  @override
  void initState() {
    _shoppingItemControllers = <ShoppingItemControllers>[];
    _shoppingItemControllers.add(
      ShoppingItemControllers(
        imagePicker: ImagePicker(),
        nameController: TextEditingController(),
        quantityController: TextEditingController(),
      ),
    );
    _uuid = getIt<Uuid>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.createShoppingList,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _shoppingItemControllers.add(
                ShoppingItemControllers(
                  imagePicker: ImagePicker(),
                  nameController: TextEditingController(),
                  quantityController: TextEditingController(),
                ),
              );
              final shoppingListItem = ShoppingListItem(
                id: _uuid.v4(),
              );

              context
                  .read<ShoppingCreateListCubit>()
                  .addShoppingListElement(shoppingListItem);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocConsumer<ShoppingCreateListCubit, ShoppingCreateListState>(
        listener: (context, state) {
          state.mapOrNull(
            error: (value) {
              ScaffoldMessenger.of(context).clearSnackBars();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.unservicedError,
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            added: (value) {
              final snackBar = SnackBar(
                content: Text(AppLocalizations.of(context)!.addedShoppingList),
              );
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              context.read<CustomUserCubit>().addShoppingList(
                    shoppingListID: value.shoppingListContainer.id,
                  );
              Navigator.pop(context);
            },
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const LoadingScreen(),
            created: (_) => ShoppingForm(
              shoppingItemControllers: _shoppingItemControllers,
            ),
          );
        },
      ),
    );
  }
}
