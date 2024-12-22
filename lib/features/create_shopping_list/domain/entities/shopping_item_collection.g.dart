// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingItemCollectionImpl _$$ShoppingItemCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingItemCollectionImpl(
      shoppingListItems: (json['shoppingListItems'] as List<dynamic>)
          .map((e) => ShoppingListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShoppingItemCollectionImplToJson(
        _$ShoppingItemCollectionImpl instance) =>
    <String, dynamic>{
      'shoppingListItems':
          instance.shoppingListItems.map((e) => e.toJson()).toList(),
    };
