import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/domain/repositories/shopping_list_repository.dart';

part 'shopping_list_state.dart';
part 'shopping_list_cubit.freezed.dart';

@LazySingleton()
class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit(
    this.shoppingListRepository,
    this.customUserCubit,
  ) : super(
          const ShoppingListState.initial(),
        );

  final ShoppingListRepository shoppingListRepository;
  final CustomUserCubit customUserCubit;
  StreamSubscription? _streamSubscription;

  void listListener() {
    customUserCubit.state.mapOrNull(loaded: (value) {
      getShoppingListContainers(value.customUser.shoppingLists);
    });
    _streamSubscription = customUserCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (value) =>
            getShoppingListContainers(value.customUser.shoppingLists),
      );
    });
  }

  void getShoppingListContainers(List<String> idLists) async {
    emit(const ShoppingListState.loading());
    final failureOrShoppingListContainers =
        await shoppingListRepository.getShoppingList(idLists);

    failureOrShoppingListContainers.fold(
      (_) => emit(
        const ShoppingListState.error(),
      ),
      (values) => emit(
        ShoppingListState.loaded(values),
      ),
    );
  }

  @disposeMethod
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
