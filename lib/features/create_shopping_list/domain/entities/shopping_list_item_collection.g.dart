// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_item_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingListItemCollectionImpl _$$ShoppingListItemCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingListItemCollectionImpl(
      shoppingListItems: (json['shoppingListItems'] as List<dynamic>)
          .map((e) => ShoppingListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShoppingListItemCollectionImplToJson(
        _$ShoppingListItemCollectionImpl instance) =>
    <String, dynamic>{
      'shoppingListItems':
          instance.shoppingListItems.map((e) => e.toJson()).toList(),
    };
