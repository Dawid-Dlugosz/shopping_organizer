import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:shopping_organizer/core/enums/firestore_collection_type.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/custom_user/data/repositories/custom_user_repository_impl.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

void main() {
  late CustomUserRepositoryImpl customUserRepository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late MockFirebaseFirestore mockFirebaseFirestore;

  setUp(() {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    mockFirebaseFirestore = MockFirebaseFirestore();
    customUserRepository = CustomUserRepositoryImpl(fakeFirebaseFirestore);
  });

  const customUser = CustomUser(
    fcmToken: '1221',
    userId: '233',
    nickname: 'nickanem',
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

      group(
        'getCustomUser',
        () {
          test('Should return Failre ', () async {
            final repository = CustomUserRepositoryImpl(mockFirebaseFirestore);

            when(() => mockFirebaseFirestore
                .collection(FirestoreCollectionType.users.type)
                .doc(customUser.userId)).thenThrow(
              Exception('firebase exception'),
            );

            final finalFailureOrCustomUser =
                await repository.getCustomUser(userId: customUser.userId);

            expect(finalFailureOrCustomUser, const Left(Failure.general()));
          });

          test(
            'Should return failure when document body is null',
            () async {
              when(
                () => fakeFirebaseFirestore
                    .collection(FirestoreCollectionType.users.type)
                    .doc(),
              );

              final finalFailureOrCustomUser = await customUserRepository
                  .getCustomUser(userId: customUser.userId);

              expect(finalFailureOrCustomUser, const Left(Failure.general()));
            },
          );

          test(
            'Should return object',
            () async {
              when(
                () => fakeFirebaseFirestore
                    .collection(FirestoreCollectionType.users.type)
                    .doc(customUser.userId)
                    .set(customUser.toJson()),
              );

              final finalFailureOrCustomUser = await customUserRepository
                  .getCustomUser(userId: customUser.userId);

              expect(finalFailureOrCustomUser, const Right(customUser));
            },
          );
        },
      );
      group(
        'isUserExist',
        () {
          test(
            'Shoule return true when user exist in database',
            () async {
              when(
                () => fakeFirebaseFirestore
                    .collection(FirestoreCollectionType.users.type)
                    .doc(customUser.userId)
                    .set(customUser.toJson()),
              );

              final failureOrResult = await customUserRepository.isUserExist(
                userId: customUser.userId,
              );

              expect(
                failureOrResult,
                const Right(true),
              );
            },
          );

          test(
            'Shoule return false when user dont exist in database',
            () async {
              final failureOrResult = await customUserRepository.isUserExist(
                userId: customUser.userId,
              );

              expect(
                failureOrResult,
                const Right(false),
              );
            },
          );

          test(
            'Shoule return failure when database throw error',
            () async {
              final repository =
                  CustomUserRepositoryImpl(mockFirebaseFirestore);

              when(() => mockFirebaseFirestore
                  .collection(FirestoreCollectionType.users.type)
                  .doc(customUser.userId)).thenThrow(
                Exception('firebase exception'),
              );

              final failureOrResult = await repository.isUserExist(
                userId: customUser.userId,
              );

              expect(
                failureOrResult,
                const Left(Failure.general()),
              );
            },
          );
        },
      );
    },
  );
}
