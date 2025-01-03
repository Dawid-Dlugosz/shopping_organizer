import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_item_collection.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/domain/repositories/shopping_list_repository.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/cubit/shopping_list_cubit.dart';

class MockShoppingListRepository extends Mock
    implements ShoppingListRepository {}

class MockCustomUserCubit extends Mock implements CustomUserCubit {}

void main() {
  late ShoppingListCubit shoppingListCubit;
  late MockShoppingListRepository mockShoppingListRepository;
  late MockCustomUserCubit mockCustomUserCubit;

  setUp(() {
    mockShoppingListRepository = MockShoppingListRepository();
    mockCustomUserCubit = MockCustomUserCubit();

    shoppingListCubit = ShoppingListCubit(
      mockShoppingListRepository,
      mockCustomUserCubit,
    );
  });

  const tIds = ['1'];
  const tIds2 = ['2', '1'];
  const tShoppingListContainer = ShoppingListContainer(
    createTimestamp: 10000,
    ownerId: 'test',
    ownerNickname: 'test',
    id: 'test',
    shoppingItemCollection: ShoppingItemCollection(
      shoppingListItems: [],
    ),
  );

  final tShoppingListContainer2 = tShoppingListContainer.copyWith(id: 'test2');

  const tCustomUser = CustomUser(
    nickname: 'nickname',
    fcmToken: 'fcmToken',
    userId: 'userId',
    shoppingLists: tIds,
  );

  group(
    'ShoppingListCubit',
    () {
      group(
        'getShoppingListContainers',
        () {
          blocTest(
            'Should emit [Loading, Loaded] when get list from database is successful',
            build: () => shoppingListCubit,
            setUp: () {
              when(
                () => mockShoppingListRepository.getShoppingList(
                  tIds,
                ),
              ).thenAnswer(
                (_) async => const Right(
                  [tShoppingListContainer],
                ),
              );
            },
            act: (_) => shoppingListCubit.getShoppingListContainers(
              tIds,
            ),
            expect: () => [
              const ShoppingListState.loading(),
              const ShoppingListState.loaded(
                [tShoppingListContainer],
              ),
            ],
          );

          blocTest(
            'Should emit [Loading, Loaded] when get list from database is error',
            build: () => shoppingListCubit,
            setUp: () {
              when(
                () => mockShoppingListRepository.getShoppingList(
                  tIds,
                ),
              ).thenAnswer(
                (_) async => const Left(
                  Failure.general(),
                ),
              );
            },
            act: (_) => shoppingListCubit.getShoppingListContainers(
              tIds,
            ),
            expect: () => [
              const ShoppingListState.loading(),
              const ShoppingListState.error(),
            ],
          );
        },
      );

      group(
        'listListener',
        () {
          blocTest(
            'Should emit [Loadin Loaded  x3] when stream emit new values',
            build: () => shoppingListCubit,
            setUp: () {
              when(
                () => mockShoppingListRepository.getShoppingList(
                  tIds,
                ),
              ).thenAnswer(
                (_) async => const Right(
                  [
                    tShoppingListContainer,
                  ],
                ),
              );

              when(
                () => mockShoppingListRepository.getShoppingList(
                  tIds2,
                ),
              ).thenAnswer(
                (_) async => Right(
                  [
                    tShoppingListContainer2,
                  ],
                ),
              );

              when(() => mockCustomUserCubit.state).thenReturn(
                const CustomUserState.loaded(
                  customUser: tCustomUser,
                ),
              );

              when(() => mockCustomUserCubit.stream).thenAnswer(
                (_) => Stream.fromIterable(
                  [
                    const CustomUserState.loaded(customUser: tCustomUser),
                    CustomUserState.loaded(
                      customUser: tCustomUser.copyWith(
                        shoppingLists: tIds2,
                      ),
                    ),
                  ],
                ),
              );
            },
            act: (_) => shoppingListCubit.listListener(),
            expect: () => [
              const ShoppingListState.loading(),
              const ShoppingListState.loaded(
                [tShoppingListContainer],
              ),
              const ShoppingListState.loading(),
              const ShoppingListState.loaded(
                [tShoppingListContainer],
              ),
              const ShoppingListState.loading(),
              ShoppingListState.loaded(
                [tShoppingListContainer2],
              ),
            ],
          );
        },
      );
    },
  );
}
