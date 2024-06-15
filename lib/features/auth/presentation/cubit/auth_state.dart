part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unAuthorized() = _$UnAuthorized;
  const factory AuthState.authorized({required User user}) = _$Authorized;
  // const factory AuthState.created({required User user}) = _$Created;
  const factory AuthState.error({String? code}) = _$Error;
}
