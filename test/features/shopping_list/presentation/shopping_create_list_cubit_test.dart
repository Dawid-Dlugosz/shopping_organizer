import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_organizer/core/entities%20/shopping_item_controllers.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:uuid/uuid.dart';

import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/cubits/shopping_create_list_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_item_collection.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/shopping_list/domain/repositories/shopping_list_repository.dart';

class MockUuid extends Mock implements Uuid {}

class MockShoppingListRepository extends Mock
    implements ShoppingListRepository {}

class MockCustomUserCubit extends Mock implements CustomUserCubit {}

void main() {
  late ShoppingCreateListCubit shoppingCreateListCubit;
  late MockUuid mockUuid;
  late MockCustomUserCubit mockCustomUserCubit;
  late MockShoppingListRepository mockShoppingListRepository;

  setUp(() {
    mockUuid = MockUuid();
    mockShoppingListRepository = MockShoppingListRepository();
    mockCustomUserCubit = MockCustomUserCubit();

    shoppingCreateListCubit = ShoppingCreateListCubit(
      mockShoppingListRepository,
      mockCustomUserCubit,
      mockUuid,
    );
  });

  const tCustomUser = CustomUser(
    nickname: 'nickName',
    fcmToken: 'dasasas',
    userId: '2132',
    shoppingLists: [],
  );

  const tShoppingListItem = ShoppingListItem(
    id: '213',
    networkImagePath: '222',
  );

  final tShoppingListContainerEmpty = ShoppingListContainer(
    ownerId: tCustomUser.userId,
    ownerNickname: tCustomUser.nickname,
    id: '223',
    shoppingItemCollection: const ShoppingItemCollection(
      shoppingListItems: [],
    ),
  );

  final tShoppingListContainer = ShoppingListContainer(
    ownerId: tCustomUser.userId,
    ownerNickname: tCustomUser.nickname,
    id: '223',
    shoppingItemCollection: const ShoppingItemCollection(
      shoppingListItems: [
        tShoppingListItem,
      ],
    ),
  );

  const tShoppingListItemToCreated = ShoppingListItem(
    id: 'test',
  );

  final tShoppingListContainerToCreated = ShoppingListContainer(
    ownerId: 'test',
    ownerNickname: 'test',
    id: 'test',
    name: 'test',
    shoppingItemCollection: ShoppingItemCollection(
      shoppingListItems: [
        tShoppingListItemToCreated.copyWith(name: 'test', quantity: '1')
      ],
    ),
  );

  final tShoppingItemControllersToCreated = [
    ShoppingItemControllers(
      nameController: TextEditingController(text: 'test'),
      quantityController: TextEditingController(text: '1'),
      imagePicker: ImagePicker(),
    ),
  ];

  group(
    'ShoppingListCubi',
    () {
      test(
        'Should expect initial state',
        () {
          expect(shoppingCreateListCubit.state,
              const ShoppingCreateListState.initial());
        },
      );

      blocTest(
        'Should emit loaded with sigle list item',
        build: () => shoppingCreateListCubit,
        act: (_) => shoppingCreateListCubit.createNewShoppingList(),
        setUp: () {
          when(() => mockUuid.v4()).thenReturn('123');

          when(() => mockCustomUserCubit.state).thenReturn(
            const CustomUserState.loaded(customUser: tCustomUser),
          );
        },
        expect: () => [
          ShoppingCreateListState.created(
            shoppingListContainer: ShoppingListContainer(
              ownerId: tCustomUser.userId,
              ownerNickname: tCustomUser.nickname,
              id: '123',
              shoppingItemCollection: const ShoppingItemCollection(
                shoppingListItems: [
                  ShoppingListItem(id: '123'),
                ],
              ),
            ),
          )
        ],
      );

      blocTest(
        'Should emit [Loaded] when is added new ShoppingList',
        build: () => shoppingCreateListCubit,
        seed: () => ShoppingCreateListState.created(
          shoppingListContainer: tShoppingListContainerEmpty,
        ),
        act: (_) =>
            shoppingCreateListCubit.addShoppingListElement(tShoppingListItem),
        expect: () => [
          ShoppingCreateListState.created(
            shoppingListContainer: tShoppingListContainerEmpty.copyWith(
              shoppingItemCollection: const ShoppingItemCollection(
                shoppingListItems: [tShoppingListItem],
              ),
            ),
          )
        ],
      );

      blocTest(
        'Should emit [Loaded] when is updatedCountType',
        build: () => shoppingCreateListCubit,
        seed: () => ShoppingCreateListState.created(
          shoppingListContainer: tShoppingListContainer,
        ),
        act: (_) => shoppingCreateListCubit.updateCountType(
          countType: CountType.grams,
          index: 0,
        ),
        expect: () => [
          ShoppingCreateListState.created(
            shoppingListContainer: tShoppingListContainer.copyWith(
              shoppingItemCollection: ShoppingItemCollection(
                shoppingListItems: [
                  tShoppingListItem.copyWith(countType: CountType.grams)
                ],
              ),
            ),
          )
        ],
      );

      blocTest(
        'Should emit [Loaded] when is addImageToItem',
        build: () => shoppingCreateListCubit,
        seed: () => ShoppingCreateListState.created(
          shoppingListContainer: tShoppingListContainer,
        ),
        act: (_) => shoppingCreateListCubit.addImageToItem(
          path: '/img/22',
          index: 0,
        ),
        expect: () => [
          ShoppingCreateListState.created(
            shoppingListContainer: tShoppingListContainer.copyWith(
              shoppingItemCollection: ShoppingItemCollection(
                shoppingListItems: [
                  tShoppingListItem.copyWith(
                    localImagePath: '/img/22',
                    networkImagePath: '223/213',
                  )
                ],
              ),
            ),
          )
        ],
      );

      blocTest(
        'Should emit [Loaded] when is addImageToItem with empty path',
        build: () => shoppingCreateListCubit,
        seed: () => ShoppingCreateListState.created(
          shoppingListContainer: tShoppingListContainer,
        ),
        act: (_) => shoppingCreateListCubit.addImageToItem(
          path: null,
          index: 0,
        ),
        expect: () => [
          ShoppingCreateListState.created(
            shoppingListContainer: tShoppingListContainer.copyWith(
              shoppingItemCollection: ShoppingItemCollection(
                shoppingListItems: [
                  tShoppingListItem.copyWith(
                    networkImagePath: null,
                  ),
                ],
              ),
            ),
          )
        ],
      );

      group(
        'createShopList',
        () {
          blocTest(
            'Should emit [Loading, Added] when create shopping list is successful',
            build: () => shoppingCreateListCubit,
            seed: () => ShoppingCreateListState.created(
              shoppingListContainer: tShoppingListContainerToCreated,
            ),
            setUp: () {
              when(() => mockShoppingListRepository.createShoppingList(
                  tShoppingListContainerToCreated)).thenAnswer(
                (_) async => const Right('uid'),
              );
            },
            act: (_) {
              shoppingCreateListCubit.createShopList(
                shoppingItemControllers: tShoppingItemControllersToCreated,
                name: 'test',
              );
            },
            expect: () => [
              const ShoppingCreateListState.loading(),
              ShoppingCreateListState.added(
                  shoppingListContainer: tShoppingListContainerToCreated)
            ],
          );

          blocTest(
            'Should emit [Loading, Erro] when create shopping list is failed',
            build: () => shoppingCreateListCubit,
            seed: () => ShoppingCreateListState.created(
              shoppingListContainer: tShoppingListContainerToCreated,
            ),
            setUp: () {
              when(() => mockShoppingListRepository.createShoppingList(
                  tShoppingListContainerToCreated)).thenAnswer(
                (_) async => const Left(Failure.general()),
              );
            },
            act: (_) {
              shoppingCreateListCubit.createShopList(
                shoppingItemControllers: tShoppingItemControllersToCreated,
                name: 'test',
              );
            },
            expect: () => [
              const ShoppingCreateListState.loading(),
              const ShoppingCreateListState.error(),
            ],
          );
        },
      );
    },
  );
}
