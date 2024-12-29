// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingItemCollection _$ShoppingItemCollectionFromJson(
    Map<String, dynamic> json) {
  return _ShoppingItemCollection.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItemCollection {
  List<ShoppingListItem> get shoppingListItems =>
      throw _privateConstructorUsedError;

  /// Serializes this ShoppingItemCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemCollectionCopyWith<ShoppingItemCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemCollectionCopyWith<$Res> {
  factory $ShoppingItemCollectionCopyWith(ShoppingItemCollection value,
          $Res Function(ShoppingItemCollection) then) =
      _$ShoppingItemCollectionCopyWithImpl<$Res, ShoppingItemCollection>;
  @useResult
  $Res call({List<ShoppingListItem> shoppingListItems});
}

/// @nodoc
class _$ShoppingItemCollectionCopyWithImpl<$Res,
        $Val extends ShoppingItemCollection>
    implements $ShoppingItemCollectionCopyWith<$Res> {
  _$ShoppingItemCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemCollection
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$ShoppingItemCollectionImplCopyWith<$Res>
    implements $ShoppingItemCollectionCopyWith<$Res> {
  factory _$$ShoppingItemCollectionImplCopyWith(
          _$ShoppingItemCollectionImpl value,
          $Res Function(_$ShoppingItemCollectionImpl) then) =
      __$$ShoppingItemCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ShoppingListItem> shoppingListItems});
}

/// @nodoc
class __$$ShoppingItemCollectionImplCopyWithImpl<$Res>
    extends _$ShoppingItemCollectionCopyWithImpl<$Res,
        _$ShoppingItemCollectionImpl>
    implements _$$ShoppingItemCollectionImplCopyWith<$Res> {
  __$$ShoppingItemCollectionImplCopyWithImpl(
      _$ShoppingItemCollectionImpl _value,
      $Res Function(_$ShoppingItemCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingListItems = null,
  }) {
    return _then(_$ShoppingItemCollectionImpl(
      shoppingListItems: null == shoppingListItems
          ? _value._shoppingListItems
          : shoppingListItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingListItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShoppingItemCollectionImpl extends _ShoppingItemCollection {
  const _$ShoppingItemCollectionImpl(
      {required final List<ShoppingListItem> shoppingListItems})
      : _shoppingListItems = shoppingListItems,
        super._();

  factory _$ShoppingItemCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemCollectionImplFromJson(json);

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
    return 'ShoppingItemCollection(shoppingListItems: $shoppingListItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemCollectionImpl &&
            const DeepCollectionEquality()
                .equals(other._shoppingListItems, _shoppingListItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_shoppingListItems));

  /// Create a copy of ShoppingItemCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemCollectionImplCopyWith<_$ShoppingItemCollectionImpl>
      get copyWith => __$$ShoppingItemCollectionImplCopyWithImpl<
          _$ShoppingItemCollectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemCollectionImplToJson(
      this,
    );
  }
}

abstract class _ShoppingItemCollection extends ShoppingItemCollection {
  const factory _ShoppingItemCollection(
          {required final List<ShoppingListItem> shoppingListItems}) =
      _$ShoppingItemCollectionImpl;
  const _ShoppingItemCollection._() : super._();

  factory _ShoppingItemCollection.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemCollectionImpl.fromJson;

  @override
  List<ShoppingListItem> get shoppingListItems;

  /// Create a copy of ShoppingItemCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemCollectionImplCopyWith<_$ShoppingItemCollectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
