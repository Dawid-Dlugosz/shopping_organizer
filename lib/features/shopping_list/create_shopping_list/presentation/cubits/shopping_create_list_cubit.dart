import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_organizer/core/entities%20/shopping_item_controllers.dart';
import 'package:uuid/uuid.dart';

import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_item_collection.dart';
import 'package:shopping_organizer/features/shopping_list/domain/repositories/shopping_list_repository.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';

part 'shopping_create_list_state.dart';
part 'shopping_create_list_cubit.freezed.dart';

@injectable
class ShoppingCreateListCubit extends Cubit<ShoppingCreateListState> {
  ShoppingCreateListCubit(
    this.shoppingListRepository,
    this.customUserCubit,
    this.uuid,
  ) : super(const ShoppingCreateListState.initial());

  final Uuid uuid;
  final ShoppingListRepository shoppingListRepository;
  final CustomUserCubit customUserCubit;

  Future<void> getAllList() async {
    emit(const ShoppingCreateListState.loading());
  }

  Future<void> createNewShoppingList() async {
    final shoppingItem = ShoppingListItem(
      id: uuid.v4(),
    );

    emit(
      ShoppingCreateListState.created(
        shoppingListContainer: ShoppingListContainer(
          ownerId: customUserCubit.state.customUser!.userId,
          ownerNickname: customUserCubit.state.customUser!.nickname,
          id: uuid.v4(),
          shoppingListItemCollection: ShoppingItemCollection(
            shoppingListItems: [
              shoppingItem,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addShoppingListElement(
    ShoppingListItem shoppingListItem,
  ) async {
    final shoppingListItemCollection = state.shoppingListItemCollection;

    emit(
      ShoppingCreateListState.created(
        shoppingListContainer: state.shoppingListContainer!.copyWith(
          shoppingListItemCollection:
              shoppingListItemCollection!.add(shoppingListItem),
        ),
      ),
    );
  }

  Future<void> updateCountType({
    required CountType countType,
    required int index,
  }) async {
    final shoppingListItemCollection = state.shoppingListItemCollection;
    final shoppingListItem = shoppingListItemCollection!
        .shoppingListItems[index]
        .updateCountType(countType);

    emit(
      ShoppingCreateListState.created(
        shoppingListContainer: state.shoppingListContainer!.copyWith(
          shoppingListItemCollection: shoppingListItemCollection.updateItem(
            shoppingListItem: shoppingListItem,
            index: index,
          ),
        ),
      ),
    );
  }

  Future<void> addImageToItem({
    required int index,
    required String? path,
  }) async {
    final shoppingListItemCollection = state.shoppingListItemCollection;
    final shoppingListItem =
        shoppingListItemCollection!.shoppingListItems[index].updateImagePaths(
      localPath: path,
      containerId: state.shoppingListContainer!.id,
    );

    emit(
      ShoppingCreateListState.created(
        shoppingListContainer: state.shoppingListContainer!.copyWith(
          shoppingListItemCollection: shoppingListItemCollection.updateItem(
            shoppingListItem: shoppingListItem,
            index: index,
          ),
        ),
      ),
    );
  }

  Future<void> createShopList({
    required List<ShoppingItemControllers> shoppingItemControllers,
    required String name,
  }) async {
    final shoppingListItemCollection = state.shoppingListItemCollection;
    var shoppingListContainer = state.shoppingListContainer!;

    emit(const ShoppingCreateListState.loading());
    final shopingListItems = <ShoppingListItem>[];

    for (var i = 0; i < shoppingItemControllers.length; i++) {
      final shoppingListItem =
          shoppingListItemCollection!.shoppingListItems[i].copyWith(
        name: shoppingItemControllers[i].nameController.text,
        quantity: shoppingItemControllers[i].quantityController.text,
      );
      shopingListItems.add(shoppingListItem);
    }

    shoppingListContainer = shoppingListContainer.copyWith(
        name: name,
        shoppingListItemCollection: shoppingListContainer
            .shoppingListItemCollection
            .updateCollection(shopingListItems));

    final failureOrUnit =
        await shoppingListRepository.createShoppingList(shoppingListContainer);

    failureOrUnit.fold(
      (_) => emit(
        ShoppingCreateListState.created(
          shoppingListContainer: shoppingListContainer,
          error: true,
        ),
      ),
      (_) => emit(
        ShoppingCreateListState.added(
          shoppingListContainer: shoppingListContainer,
        ),
      ),
    );
  }
}
