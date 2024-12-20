// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomUserImpl _$$CustomUserImplFromJson(Map<String, dynamic> json) =>
    _$CustomUserImpl(
      nickname: json['nickname'] as String,
      fcmToken: json['fcmToken'] as String,
      userId: json['userId'] as String,
      maxListCount: (json['maxListCount'] as num?)?.toInt() ?? 4,
      isPremium: json['isPremium'] as bool? ?? false,
      shoppingLists: (json['shoppingLists'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CustomUserImplToJson(_$CustomUserImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'fcmToken': instance.fcmToken,
      'userId': instance.userId,
      'maxListCount': instance.maxListCount,
      'isPremium': instance.isPremium,
      'shoppingLists': instance.shoppingLists,
    };
