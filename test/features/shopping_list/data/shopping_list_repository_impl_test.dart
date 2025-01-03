import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:shopping_organizer/core/enums/firestore_collection_type.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_item_collection.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/shopping_list/repositories/shopping_list_repository_impl.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockedFirebaseStorage extends Mock implements FirebaseStorage {}

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockFirebaseStorage mockFirebaseStorage;
  late MockedFirebaseStorage mockedFirebaseStorage;
  setUp(() {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockFirebaseStorage = MockFirebaseStorage();
    mockedFirebaseStorage = MockedFirebaseStorage();
  });

  const tShoppingListContainer = ShoppingListContainer(
    ownerId: '212132',
    ownerNickname: 'test',
    id: '1',
    name: 'name',
    shoppingItemCollection: ShoppingItemCollection(
      shoppingListItems: [
        ShoppingListItem(
          id: '1212',
          quantity: '2323',
          name: 'text',
          localImagePath: '/img/test.jpg',
        )
      ],
    ),
  );

  const tIds = ['1'];

  group('ShoppingListRepositoryImpl', () {
    group('createShoppingList', () {
      test(
        'Should return String when everything is good',
        () async {
          final repository = ShoppingListRepositoryImpl(
            fakeFirebaseFirestore,
            mockFirebaseStorage,
          );

          final failureOrString =
              await repository.createShoppingList(tShoppingListContainer);

          expect(failureOrString, const Right('1'));
        },
      );

      test(
        'Should return Failure when send image throw error',
        () async {
          when(() => mockedFirebaseStorage.ref()).thenThrow(
            Exception(),
          );

          final repository = ShoppingListRepositoryImpl(
            fakeFirebaseFirestore,
            mockedFirebaseStorage,
          );

          final failureOrString =
              await repository.createShoppingList(tShoppingListContainer);

          expect(failureOrString, const Left(Failure.general()));
        },
      );

      test(
        'Should return Failure when send to firestore throw exception',
        () async {
          when(() => mockFirebaseFirestore
              .collection(FirestoreCollectionType.shoppingList.type)
              .doc(tShoppingListContainer.id)
              .set(tShoppingListContainer.toJson())).thenThrow(
            Exception(),
          );

          final repository = ShoppingListRepositoryImpl(
            fakeFirebaseFirestore,
            mockedFirebaseStorage,
          );

          final failureOrString =
              await repository.createShoppingList(tShoppingListContainer);

          expect(failureOrString, const Left(Failure.general()));
        },
      );
    });

    group(
      'getShoppingList',
      () {
        test(
          'Shoule return Left when firiebase throw exception',
          () async {
            when(() => mockFirebaseFirestore
                .collection(FirestoreCollectionType.shoppingList.type)
                .where(
                  'id',
                  whereIn: tIds,
                )
                .get()).thenThrow(Exception());

            final repository = ShoppingListRepositoryImpl(
              mockFirebaseFirestore,
              mockedFirebaseStorage,
            );

            final failureOrShoppingListContainers =
                await repository.getShoppingList(tIds);

            expect(
              failureOrShoppingListContainers,
              const Left(
                Failure.general(),
              ),
            );
          },
        );

        test(
          'Shoule return Right with empty list when firiebase not have ids',
          () async {
            fakeFirebaseFirestore
                .collection(FirestoreCollectionType.shoppingList.type)
                .doc(tShoppingListContainer.id)
                .set(tShoppingListContainer.toJson());

            final repository = ShoppingListRepositoryImpl(
              fakeFirebaseFirestore,
              mockedFirebaseStorage,
            );

            final failureOrShoppingListContainers =
                await repository.getShoppingList([]);

            expect(
              failureOrShoppingListContainers.toOption().toNullable(),
              isA<List<ShoppingListContainer>>(),
            );

            expect(
              failureOrShoppingListContainers.toOption().toNullable()?.length,
              0,
            );
          },
        );

        test(
          'Shoule return Right with not empty list',
          () async {
            fakeFirebaseFirestore
                .collection(FirestoreCollectionType.shoppingList.type)
                .doc(tShoppingListContainer.id)
                .set(tShoppingListContainer.toJson());

            final repository = ShoppingListRepositoryImpl(
              fakeFirebaseFirestore,
              mockedFirebaseStorage,
            );

            final failureOrShoppingListContainers =
                await repository.getShoppingList(tIds);

            expect(
              failureOrShoppingListContainers.toOption().toNullable(),
              isA<List<ShoppingListContainer>>(),
            );

            expect(
              failureOrShoppingListContainers.toOption().toNullable()?.length,
              1,
            );
          },
        );
      },
    );
  });
}
