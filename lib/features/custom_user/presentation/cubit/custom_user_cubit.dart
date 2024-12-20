import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shopping_organizer/core/enums/custom_user_error.dart';
import 'package:shopping_organizer/core/helpers/user_helper.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/domain/repositories/custom_user_repository.dart';

part 'custom_user_state.dart';
part 'custom_user_cubit.freezed.dart';

@LazySingleton()
class CustomUserCubit extends Cubit<CustomUserState> {
  CustomUserCubit(
    this.customUserRepository,
    this.firebaseMessaging,
  ) : super(const CustomUserState.initial());

  final CustomUserRepository customUserRepository;
  final FirebaseMessaging firebaseMessaging;

  Future<void> getCustomUser({required String userId}) async {
    final failureOrCustomUser =
        await customUserRepository.getCustomUser(userId: userId);

    failureOrCustomUser.fold(
      (_) => emit(
        CustomUserState.error(message: CustomUserError.emptyUser.code),
      ),
      (customUser) async {
        final fcmToken =
            await UserHelper.getFCMToken(firebaseMessaging: firebaseMessaging);

        if (fcmToken != customUser.fcmToken) {
          final failureOrUnit = await customUserRepository.updateFCMToken(
            fcmToken: fcmToken,
            userId: customUser.userId,
          );

          failureOrUnit.fold(
            (_) => emit(
              CustomUserState.loaded(customUser: customUser),
            ),
            (_) => emit(
              CustomUserState.loaded(
                customUser: customUser.copyWith(fcmToken: fcmToken),
              ),
            ),
          );
        } else {
          emit(
            CustomUserState.loaded(customUser: customUser),
          );
        }
      },
    );
  }

  Future<void> createCustomUser({
    required String nickname,
    required String userId,
  }) async {
    final fcmToken =
        await UserHelper.getFCMToken(firebaseMessaging: firebaseMessaging);

    final customUser = CustomUser(
      nickname: nickname,
      fcmToken: fcmToken,
      userId: userId,
    );

    final failureOrUnit = await customUserRepository.createCustomUser(
      customUser: customUser,
    );

    failureOrUnit.fold(
      (_) => emit(
        CustomUserState.error(
          message: CustomUserError.createFailure.code,
        ),
      ),
      (_) => emit(
        CustomUserState.loaded(customUser: customUser),
      ),
    );
  }

  // TODO TESTY
  void addShoppingList({required String shoppingListID}) {
    state.mapOrNull(loaded: (value) async {
      final shoppingsLists = [
        ...value.customUser.shoppingLists,
        shoppingListID
      ];
      final failureOrUnit = await customUserRepository.updateShoppingList(
        shoppingList: shoppingsLists,
        userId: value.customUser.userId,
      );

      failureOrUnit.fold(
        (_) => emit(
          const CustomUserState.error(message: ''),
        ),
        (_) => emit(
          CustomUserState.loaded(
            customUser: value.customUser.copyWith(
              shoppingLists: shoppingsLists,
            ),
          ),
        ),
      );
    });
  }
}
