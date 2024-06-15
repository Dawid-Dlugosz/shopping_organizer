import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_user_shop_list.freezed.dart';
part 'custom_user_shop_list.g.dart';

@freezed
class CustomUserShopList with _$CustomUserShopList {
  const factory CustomUserShopList({
    required String ownerId,
    required String listId,
    required bool isAcceptInvite,
  }) = _CustomUserShopList;

  factory CustomUserShopList.fromJson(Map<String, dynamic> json) =>
      _$CustomUserShopListFromJson(json);
}
