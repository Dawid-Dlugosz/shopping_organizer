// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomUserImpl _$$CustomUserImplFromJson(Map<String, dynamic> json) =>
    _$CustomUserImpl(
      fcmToken: json['fcmToken'] as String,
      userId: json['userId'] as String,
      shoppingLists: (json['shoppingLists'] as List<dynamic>)
          .map((e) => CustomUserShopList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomUserImplToJson(_$CustomUserImpl instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'userId': instance.userId,
      'shoppingLists': instance.shoppingLists.map((e) => e.toJson()).toList(),
    };
