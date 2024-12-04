// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_user.freezed.dart';
part 'custom_user.g.dart';

@freezed
class CustomUser with _$CustomUser {
  @JsonSerializable(explicitToJson: true)
  const factory CustomUser({
    required String nickname,
    required String fcmToken,
    required String userId,
    required List<String> shoppingLists,
  }) = _CustomUser;

  factory CustomUser.fromJson(Map<String, dynamic> json) =>
      _$CustomUserFromJson(json);
}
