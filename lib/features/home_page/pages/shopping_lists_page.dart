import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_organizer/core/widgets/loading_widget.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/cubit/shopping_list_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/widgets/shopping_list_containers.dart';

class ShopngListsPage extends StatelessWidget {
  const ShopngListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (value) {
            final shoppintListContainers = value.shoppingListContainers;
            if (shoppintListContainers.isEmpty) {
              // TODO EMPTY WIDGET
              return Center(
                child: Text('Pusto'),
              );
            }
            return ShoppintListContainers(
              shoppingListContainers: shoppintListContainers,
            );
          },
          error: (_) => Center(
            // TODO ERROR WIDGET
            child: Text('coś poszło nie tak'),
          ),
          orElse: () => LoadingWidget(),
        );
      },
    );
  }
}
