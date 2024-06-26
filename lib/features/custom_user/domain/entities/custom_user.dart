// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user_shop_list.dart';

part 'custom_user.freezed.dart';
part 'custom_user.g.dart';

@freezed
class CustomUser with _$CustomUser {
  @JsonSerializable(explicitToJson: true)
  const factory CustomUser({
    required String nickname,
    required String fcmToken,
    required String userId,
    required List<CustomUserShopList> shoppingLists,
  }) = _CustomUser;

  factory CustomUser.fromJson(Map<String, dynamic> json) =>
      _$CustomUserFromJson(json);
}
