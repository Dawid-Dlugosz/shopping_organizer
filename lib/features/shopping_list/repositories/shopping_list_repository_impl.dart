import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:shopping_organizer/core/enums/firestore_collection_type.dart';

import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/shopping_list/domain/entities/shopping_list_container.dart';
import 'package:shopping_organizer/features/shopping_list/domain/repositories/shopping_list_repository.dart';

@LazySingleton(as: ShoppingListRepository)
class ShoppingListRepositoryImpl implements ShoppingListRepository {
  ShoppingListRepositoryImpl(this.firebaseFirestore, this.firebaseStorage);

  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  final Logger logger = Logger();

  @override
  Future<Either<Failure, String>> createShoppingList(
    ShoppingListContainer shoppingListContainer,
  ) async {
    try {
      await _sendImagesToStorage(shoppingListContainer);

      await firebaseFirestore
          .collection(FirestoreCollectionType.shoppingList.type)
          .doc(shoppingListContainer.id)
          .set(
            shoppingListContainer.toJson(),
          );
      return Right(shoppingListContainer.id);
    } catch (e, s) {
      logger.e(
        e.toString(),
        error: e,
        stackTrace: s,
      );

      return const Left(Failure.general());
    }
  }

  Future<void> _sendImagesToStorage(
    ShoppingListContainer shoppingListContainer,
  ) async {
    if (shoppingListContainer.shoppingItemCollection.isAnyImage) {
      final reference =
          firebaseStorage.ref().child('${shoppingListContainer.id}/');

      final shoppingListItemsWithImage = shoppingListContainer
          .shoppingItemCollection.shoppingListItemsWithImage;

      await Future.forEach(shoppingListItemsWithImage, (element) async {
        final file = File(element.localImagePath!);
        final uploadTask = reference.child(element.id).putFile(file);
        await uploadTask;
      });
    }
  }

  @override
  Future<Either<Failure, List<ShoppingListContainer>>> getShoppingList(
    List<String> idLists,
  ) async {
    try {
      final querySnapshot = await firebaseFirestore
          .collection(FirestoreCollectionType.shoppingList.type)
          .where(
            'id',
            whereIn: idLists,
          )
          .get();

      final docs = querySnapshot.docs;
      final shoppingListContainers = <ShoppingListContainer>[];

      for (var element in docs) {
        final body = element.data();
        shoppingListContainers.add(ShoppingListContainer.fromJson(body));
      }

      return Right(shoppingListContainers);
    } catch (e, s) {
      logger.e(
        e.toString(),
        error: e,
        stackTrace: s,
      );

      return const Left(Failure.general());
    }
  }
}
