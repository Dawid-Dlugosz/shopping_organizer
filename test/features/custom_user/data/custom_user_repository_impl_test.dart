import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

import 'package:shopping_organizer/core/enums/firestore_collection_type.dart';
import 'package:shopping_organizer/features/custom_user/data/repositories/custom_user_repository_impl.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';

void main() {
  late CustomUserRepositoryImpl customUserRepository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  setUp(() {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    customUserRepository = CustomUserRepositoryImpl(fakeFirebaseFirestore);
  });

  const customUser = CustomUser(
    fcmToken: '1221',
    userId: '233',
    shoppingLists: [],
  );

  group(
    'CustomUserRepositoryImpl',
    () {
      group(
        'createCustomUser',
        () {
          test(
            'When user create is successful should be unit',
            () async {
              final failureOrUser = await customUserRepository.createCustomUser(
                customUser: customUser,
              );

              expect(
                failureOrUser,
                const Right(unit),
              );
            },
          );
        },
      );

      group(
        'updateFCMToken',
        () {
          test(
            'When successful update FCM token then return unit',
            () async {
              fakeFirebaseFirestore
                  .collection(FirestoreCollectionType.users.type)
                  .doc(customUser.userId)
                  .set(customUser.toJson());

              final failureOrUser = await customUserRepository.updateFCMToken(
                userId: customUser.userId,
                fcmToken: '2222',
              );

              expect(
                failureOrUser,
                const Right(unit),
              );
            },
          );
        },
      );
    },
  );
}
