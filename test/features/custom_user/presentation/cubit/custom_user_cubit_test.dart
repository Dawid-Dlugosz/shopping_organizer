import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_organizer/core/enums/custom_user_error.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/domain/repositories/custom_user_repository.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';

class MockCustomUserRepository extends Mock implements CustomUserRepository {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

void main() {
  late CustomUserCubit cubit;
  late MockCustomUserRepository mockCustomUserRepository;
  late MockFirebaseMessaging mockFirebaseMessaging;

  setUp(() {
    mockCustomUserRepository = MockCustomUserRepository();
    mockFirebaseMessaging = MockFirebaseMessaging();

    cubit = CustomUserCubit(
      mockCustomUserRepository,
      mockFirebaseMessaging,
    );
  });

  const customUser = CustomUser(
    fcmToken: '123',
    userId: '123',
    shoppingLists: [],
  );

  group(
    'CustomUserCubit',
    () {
      test('should emit [Initial] as a first state', () {
        expect(cubit.state, const CustomUserState.initial());
      });

      group(
        'CustomUserCubit',
        () {
          blocTest(
            'Should emit [Loaded] when repo return right',
            build: () => cubit,
            setUp: () {
              when(
                () => mockCustomUserRepository.createCustomUser(
                    customUser: customUser),
              ).thenAnswer(
                (_) async => const Right(unit),
              );
            },
            act: (_) {
              cubit.createCustomUser(customUser: customUser);
            },
            expect: () => [
              const CustomUserState.loaded(customUser: customUser),
            ],
          );

          blocTest(
            'Should emit [Error] when repo return left',
            build: () => cubit,
            setUp: () {
              when(
                () => mockCustomUserRepository.createCustomUser(
                    customUser: customUser),
              ).thenAnswer(
                (_) async => const Left(Failure.general()),
              );
            },
            act: (_) {
              cubit.createCustomUser(customUser: customUser);
            },
            expect: () => [
              CustomUserState.error(
                  message: CustomUserError.createFailure.code),
            ],
          );
        },
      );
      group(
        'getCustomUser',
        () {
          blocTest(
            'Should emit [Error] with empty user message when  gettCustomUser return left',
            build: () => cubit,
            setUp: () {
              when(
                () => mockCustomUserRepository.getCustomUser(
                  userId: any(named: 'userId'),
                ),
              ).thenAnswer(
                (invocation) async => const Left(
                  Failure.general(),
                ),
              );
            },
            act: (_) {
              cubit.getCustomUser(userId: '123');
            },
            expect: () => [
              CustomUserState.error(message: CustomUserError.emptyUser.code)
            ],
          );

          blocTest(
            'Should emit [Error] with fcmError message when updateFCMToken return left',
            build: () => cubit,
            setUp: () {
              when(
                () => mockCustomUserRepository.getCustomUser(
                  userId: any(named: 'userId'),
                ),
              ).thenAnswer(
                (invocation) async => const Right(customUser),
              );

              when(() => mockFirebaseMessaging.getToken()).thenAnswer(
                (invocation) async => 'testFCM',
              );
              when(
                () => mockCustomUserRepository.updateFCMToken(
                    userId: '123', fcmToken: 'testFCM'),
              ).thenAnswer(
                (invocation) async => const Left(
                  Failure.general(),
                ),
              );
            },
            act: (_) {
              cubit.getCustomUser(userId: '123');
            },
            expect: () =>
                [CustomUserState.error(message: CustomUserError.fcmError.code)],
          );

          blocTest(
            'Should emit [Loaded] with not change fcmToken',
            build: () => cubit,
            setUp: () {
              when(
                () => mockCustomUserRepository.getCustomUser(
                  userId: any(named: 'userId'),
                ),
              ).thenAnswer(
                (invocation) async => const Right(customUser),
              );

              when(() => mockFirebaseMessaging.getToken()).thenAnswer(
                (invocation) async => '123',
              );

              when(
                () => mockCustomUserRepository.updateFCMToken(
                    userId: '123', fcmToken: '123'),
              ).thenAnswer(
                (invocation) async => const Right(unit),
              );
            },
            act: (_) {
              cubit.getCustomUser(userId: '123');
            },
            expect: () => [
              const CustomUserState.loaded(customUser: customUser),
            ],
          );

          blocTest(
            'Should emit [Loaded] with  change fcmToken',
            build: () => cubit,
            setUp: () {
              when(
                () => mockCustomUserRepository.getCustomUser(
                  userId: any(named: 'userId'),
                ),
              ).thenAnswer(
                (invocation) async => const Right(customUser),
              );

              when(() => mockFirebaseMessaging.getToken()).thenAnswer(
                (invocation) async => '321',
              );

              when(
                () => mockCustomUserRepository.updateFCMToken(
                    userId: '123', fcmToken: '321'),
              ).thenAnswer(
                (invocation) async => const Right(unit),
              );
            },
            act: (_) {
              cubit.getCustomUser(userId: '123');
            },
            expect: () => [
              CustomUserState.loaded(
                customUser: customUser.copyWith(fcmToken: '321'),
              ),
            ],
          );
        },
      );
    },
  );
}
