import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

import 'package:mocktail/mocktail.dart';
import 'package:shopping_organizer/core/enums/firestore_collection_type.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/shopping_list/repositories/shopping_list_repository_impl.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_item.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_item_collection.dart';

import 'package:shopping_organizer/features/shopping_list/domain/repositories/shopping_list_repository.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockedFirebaseStorage extends Mock implements FirebaseStorage {}

void main() {
  late ShoppingListRepository shoppingListRepository;
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
    id: '12121',
    name: 'name',
    shoppingListItemCollection: ShoppingListItemCollection(
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

          expect(failureOrString, const Right('12121'));
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
  });
}
