part of 'custom_user_cubit.dart';

@freezed
class CustomUserState with _$UserCubitState {
  const CustomUserState._();
  const factory CustomUserState.initial() = _Initial;
  const factory CustomUserState.loaded({required CustomUser customUser}) =
      _$Loaded;
  const factory CustomUserState.error({required String message}) = _$Error;

  CustomUser? get customUser {
    return mapOrNull(loaded: (value) => value.customUser);
  }
}
