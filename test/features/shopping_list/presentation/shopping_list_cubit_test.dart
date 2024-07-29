import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/entities/shopping_list_item_collection.dart';
import 'package:shopping_organizer/features/create_shopping_list/domain/repositories/shopping_list_repository.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/cubits/shopping_list_cubit.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:uuid/uuid.dart';

class MockUuid extends Mock implements Uuid {}

class MockShoppingListRepository extends Mock
    implements ShoppingListRepository {}

class MockCustomUserCubit extends Mock implements CustomUserCubit {}

void main() {
  late ShoppingListCubit shoppingListCubit;
  late MockUuid mockUuid;
  late MockCustomUserCubit mockCustomUserCubit;
  late MockShoppingListRepository mockShoppingListRepository;

  setUp(() {
    mockUuid = MockUuid();
    mockShoppingListRepository = MockShoppingListRepository();
    mockCustomUserCubit = MockCustomUserCubit();

    shoppingListCubit = ShoppingListCubit(
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
    shoppingListItemCollection: const ShoppingListItemCollection(
      shoppingListItems: [],
    ),
  );

  final tShoppingListContainer = ShoppingListContainer(
    ownerId: tCustomUser.userId,
    ownerNickname: tCustomUser.nickname,
    id: '223',
    shoppingListItemCollection: const ShoppingListItemCollection(
      shoppingListItems: [
        tShoppingListItem,
      ],
    ),
  );

  group(
    'ShoppingListCubi',
    () {
      test(
        'Should expect initial state',
        () {
          expect(shoppingListCubit.state, const ShoppingListState.initial());
        },
      );

      blocTest(
        'Should emit loaded with sigle list item',
        build: () => shoppingListCubit,
        act: (_) => shoppingListCubit.createNewShoppingList(),
        setUp: () {
          when(() => mockUuid.v4()).thenReturn('123');

          when(() => mockCustomUserCubit.state).thenReturn(
            const CustomUserState.loaded(customUser: tCustomUser),
          );
        },
        expect: () => [
          ShoppingListState.loaded(
            shoppingListContainer: ShoppingListContainer(
              ownerId: tCustomUser.userId,
              ownerNickname: tCustomUser.nickname,
              id: '123',
              shoppingListItemCollection: const ShoppingListItemCollection(
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
        build: () => shoppingListCubit,
        seed: () => ShoppingListState.loaded(
          shoppingListContainer: tShoppingListContainerEmpty,
        ),
        act: (_) => shoppingListCubit.addShoppingListElement(tShoppingListItem),
        expect: () => [
          ShoppingListState.loaded(
            shoppingListContainer: tShoppingListContainerEmpty.copyWith(
              shoppingListItemCollection: const ShoppingListItemCollection(
                shoppingListItems: [tShoppingListItem],
              ),
            ),
          )
        ],
      );

      blocTest(
        'Should emit [Loaded] when is updatedCountType',
        build: () => shoppingListCubit,
        seed: () => ShoppingListState.loaded(
          shoppingListContainer: tShoppingListContainer,
        ),
        act: (_) => shoppingListCubit.updateCountType(
          countType: CountType.grams,
          index: 0,
        ),
        expect: () => [
          ShoppingListState.loaded(
            shoppingListContainer: tShoppingListContainer.copyWith(
              shoppingListItemCollection: ShoppingListItemCollection(
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
        build: () => shoppingListCubit,
        seed: () => ShoppingListState.loaded(
          shoppingListContainer: tShoppingListContainer,
        ),
        act: (_) => shoppingListCubit.addImageToItem(
          path: '/img/22',
          index: 0,
        ),
        expect: () => [
          ShoppingListState.loaded(
            shoppingListContainer: tShoppingListContainer.copyWith(
              shoppingListItemCollection: ShoppingListItemCollection(
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
        build: () => shoppingListCubit,
        seed: () => ShoppingListState.loaded(
          shoppingListContainer: tShoppingListContainer,
        ),
        act: (_) => shoppingListCubit.addImageToItem(
          path: null,
          index: 0,
        ),
        expect: () => [
          ShoppingListState.loaded(
            shoppingListContainer: tShoppingListContainer.copyWith(
              shoppingListItemCollection: ShoppingListItemCollection(
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
          // TODO TESTY
        },
      );
    },
  );
}
