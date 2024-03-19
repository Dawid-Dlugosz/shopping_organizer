import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_organizer/core/enums/custom_user_error.dart';

import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/domain/repositories/custom_user_repository.dart';

part 'custom_user_state.dart';
part 'cusom_user_cubit.freezed.dart';

// TODO TESTY I REPO
@LazySingleton()
class CustomUserCubit extends Cubit<CustomUserState> {
  CustomUserCubit(this.customUserRepository)
      : super(const CustomUserState.initial());

  final CustomUserRepository customUserRepository;

  Future<void> createCustomUser({required CustomUser customUser}) async {
    final failureOrUnit = await customUserRepository.createCustomUser(
      customUser: customUser,
    );

    failureOrUnit.fold(
      (_) => emit(
        CustomUserState.error(
          message: CustomUserError.createFailure.code,
        ),
      ),
      (_) => emit(CustomUserState.loaded(customUser: customUser)),
    );
  }

  Future<void> updateFCMToken({required String fcmToken}) async {
    final customUser = state.customUser;
    if (customUser?.fcmToken == fcmToken) {
      return;
    } else {
      final newCustomUser = customUser?.copyWith(fcmToken: fcmToken);
      if (newCustomUser != null) {
        final failureOrUnit = await customUserRepository.updateFCMToken(
          fcmToken: fcmToken,
          userId: customUser!.userId,
        );

        failureOrUnit.fold(
          (_) => emit(
            CustomUserState.error(
              message: CustomUserError.repoFailure.code,
            ),
          ),
          (_) => emit(
            CustomUserState.loaded(customUser: newCustomUser),
          ),
        );
      } else {
        emit(
          CustomUserState.error(
            message: CustomUserError.emptyUser.code,
          ),
        );
      }
    }
  }
}
