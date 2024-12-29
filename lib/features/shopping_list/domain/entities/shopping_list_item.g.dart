// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingListItemImpl _$$ShoppingListItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingListItemImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      quantity: json['quantity'] as String?,
      countType: $enumDecodeNullable(_$CountTypeEnumMap, json['countType']) ??
          CountType.piece,
      networkImagePath: json['networkImagePath'] as String?,
      isBought: json['isBought'] as bool? ?? false,
    );

Map<String, dynamic> _$$ShoppingListItemImplToJson(
        _$ShoppingListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'countType': _$CountTypeEnumMap[instance.countType]!,
      'networkImagePath': instance.networkImagePath,
      'isBought': instance.isBought,
    };

const _$CountTypeEnumMap = {
  CountType.piece: 'piece',
  CountType.package: 'package',
  CountType.grams: 'grams',
  CountType.kilograms: 'kilograms',
};
