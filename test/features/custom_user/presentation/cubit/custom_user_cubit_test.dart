import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_organizer/core/enums/custom_user_error.dart';
import 'package:shopping_organizer/core/failures/failure.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/domain/repositories/custom_user_repository.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';

class MockCustomUserRepository extends Mock implements CustomUserRepository {}

void main() {
  late CustomUserCubit cubit;
  late MockCustomUserRepository mockCustomUserRepository;

  setUp(() {
    mockCustomUserRepository = MockCustomUserRepository();
    cubit = CustomUserCubit(mockCustomUserRepository);
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
        'updateFCMToken',
        () {
          blocTest(
            'Should emit [Error] when repo return right but state is not loaded',
            build: () => cubit,
            setUp: () {
              when(
                () => mockCustomUserRepository.updateFCMToken(
                  userId: any(named: 'userId'),
                  fcmToken: any(named: 'fcmToken'),
                ),
              );
            },
            act: (_) {
              cubit.updateFCMToken(fcmToken: '123');
            },
            expect: () => [
              CustomUserState.error(
                message: CustomUserError.emptyUser.code,
              )
            ],
          );

          blocTest(
            'Should emit [] when fcmToken from sate is the same as function argument',
            build: () => cubit,
            seed: () => const CustomUserState.loaded(customUser: customUser),
            act: (_) {
              cubit.updateFCMToken(fcmToken: '123');
            },
            expect: () => [],
          );
          blocTest(
            'Should emit [Loaded] when fcmToken from sate is diferent  as function argument as repo return right',
            build: () => cubit,
            seed: () => const CustomUserState.loaded(customUser: customUser),
            setUp: () {
              when(
                () => mockCustomUserRepository.updateFCMToken(
                  userId: any(named: 'userId'),
                  fcmToken: any(named: 'fcmToken'),
                ),
              ).thenAnswer((_) async => const Right(unit));
            },
            act: (_) {
              cubit.updateFCMToken(fcmToken: '23');
            },
            expect: () => [
              CustomUserState.loaded(
                customUser: customUser.copyWith(fcmToken: '23'),
              )
            ],
          );

          blocTest(
            'Should emit [Error] when fcmToken from sate is diferent  as function argument as repo return left',
            build: () => cubit,
            seed: () => const CustomUserState.loaded(customUser: customUser),
            setUp: () {
              when(
                () => mockCustomUserRepository.updateFCMToken(
                  userId: any(named: 'userId'),
                  fcmToken: any(named: 'fcmToken'),
                ),
              ).thenAnswer((_) async => const Left(Failure.general()));
            },
            act: (_) {
              cubit.updateFCMToken(fcmToken: '23');
            },
            expect: () => [
              CustomUserState.error(
                message: CustomUserError.repoFailure.code,
              ),
            ],
          );
        },
      );
    },
  );
}
