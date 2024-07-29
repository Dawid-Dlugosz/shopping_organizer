// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_item_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingListItemCollection _$ShoppingListItemCollectionFromJson(
    Map<String, dynamic> json) {
  return _ShoppingListItemCollection.fromJson(json);
}

/// @nodoc
mixin _$ShoppingListItemCollection {
  List<ShoppingListItem> get shoppingListItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListItemCollectionCopyWith<ShoppingListItemCollection>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListItemCollectionCopyWith<$Res> {
  factory $ShoppingListItemCollectionCopyWith(ShoppingListItemCollection value,
          $Res Function(ShoppingListItemCollection) then) =
      _$ShoppingListItemCollectionCopyWithImpl<$Res,
          ShoppingListItemCollection>;
  @useResult
  $Res call({List<ShoppingListItem> shoppingListItems});
}

/// @nodoc
class _$ShoppingListItemCollectionCopyWithImpl<$Res,
        $Val extends ShoppingListItemCollection>
    implements $ShoppingListItemCollectionCopyWith<$Res> {
  _$ShoppingListItemCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingListItems = null,
  }) {
    return _then(_value.copyWith(
      shoppingListItems: null == shoppingListItems
          ? _value.shoppingListItems
          : shoppingListItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingListItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingListItemCollectionImplCopyWith<$Res>
    implements $ShoppingListItemCollectionCopyWith<$Res> {
  factory _$$ShoppingListItemCollectionImplCopyWith(
          _$ShoppingListItemCollectionImpl value,
          $Res Function(_$ShoppingListItemCollectionImpl) then) =
      __$$ShoppingListItemCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ShoppingListItem> shoppingListItems});
}

/// @nodoc
class __$$ShoppingListItemCollectionImplCopyWithImpl<$Res>
    extends _$ShoppingListItemCollectionCopyWithImpl<$Res,
        _$ShoppingListItemCollectionImpl>
    implements _$$ShoppingListItemCollectionImplCopyWith<$Res> {
  __$$ShoppingListItemCollectionImplCopyWithImpl(
      _$ShoppingListItemCollectionImpl _value,
      $Res Function(_$ShoppingListItemCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingListItems = null,
  }) {
    return _then(_$ShoppingListItemCollectionImpl(
      shoppingListItems: null == shoppingListItems
          ? _value._shoppingListItems
          : shoppingListItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingListItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShoppingListItemCollectionImpl extends _ShoppingListItemCollection {
  const _$ShoppingListItemCollectionImpl(
      {required final List<ShoppingListItem> shoppingListItems})
      : _shoppingListItems = shoppingListItems,
        super._();

  factory _$ShoppingListItemCollectionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ShoppingListItemCollectionImplFromJson(json);

  final List<ShoppingListItem> _shoppingListItems;
  @override
  List<ShoppingListItem> get shoppingListItems {
    if (_shoppingListItems is EqualUnmodifiableListView)
      return _shoppingListItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingListItems);
  }

  @override
  String toString() {
    return 'ShoppingListItemCollection(shoppingListItems: $shoppingListItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListItemCollectionImpl &&
            const DeepCollectionEquality()
                .equals(other._shoppingListItems, _shoppingListItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_shoppingListItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListItemCollectionImplCopyWith<_$ShoppingListItemCollectionImpl>
      get copyWith => __$$ShoppingListItemCollectionImplCopyWithImpl<
          _$ShoppingListItemCollectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListItemCollectionImplToJson(
      this,
    );
  }
}

abstract class _ShoppingListItemCollection extends ShoppingListItemCollection {
  const factory _ShoppingListItemCollection(
          {required final List<ShoppingListItem> shoppingListItems}) =
      _$ShoppingListItemCollectionImpl;
  const _ShoppingListItemCollection._() : super._();

  factory _ShoppingListItemCollection.fromJson(Map<String, dynamic> json) =
      _$ShoppingListItemCollectionImpl.fromJson;

  @override
  List<ShoppingListItem> get shoppingListItems;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListItemCollectionImplCopyWith<_$ShoppingListItemCollectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
