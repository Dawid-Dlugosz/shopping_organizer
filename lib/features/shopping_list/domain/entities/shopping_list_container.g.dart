// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingListContainerImpl _$$ShoppingListContainerImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingListContainerImpl(
      ownerId: json['ownerId'] as String,
      ownerNickname: json['ownerNickname'] as String,
      id: json['id'] as String,
      shoppingItemCollection: ShoppingItemCollection.fromJson(
          json['shoppingItemCollection'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ShoppingListContainerImplToJson(
        _$ShoppingListContainerImpl instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'ownerNickname': instance.ownerNickname,
      'id': instance.id,
      'shoppingItemCollection': instance.shoppingItemCollection.toJson(),
      'name': instance.name,
    };
