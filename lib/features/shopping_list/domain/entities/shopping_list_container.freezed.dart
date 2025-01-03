// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingListContainer _$ShoppingListContainerFromJson(
    Map<String, dynamic> json) {
  return _ShoppingListContainer.fromJson(json);
}

/// @nodoc
mixin _$ShoppingListContainer {
  String get ownerId => throw _privateConstructorUsedError;
  String get ownerNickname => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get createTimestamp => throw _privateConstructorUsedError;
  ShoppingItemCollection get shoppingItemCollection =>
      throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ShoppingListContainer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingListContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingListContainerCopyWith<ShoppingListContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListContainerCopyWith<$Res> {
  factory $ShoppingListContainerCopyWith(ShoppingListContainer value,
          $Res Function(ShoppingListContainer) then) =
      _$ShoppingListContainerCopyWithImpl<$Res, ShoppingListContainer>;
  @useResult
  $Res call(
      {String ownerId,
      String ownerNickname,
      String id,
      int createTimestamp,
      ShoppingItemCollection shoppingItemCollection,
      String? name});

  $ShoppingItemCollectionCopyWith<$Res> get shoppingItemCollection;
}

/// @nodoc
class _$ShoppingListContainerCopyWithImpl<$Res,
        $Val extends ShoppingListContainer>
    implements $ShoppingListContainerCopyWith<$Res> {
  _$ShoppingListContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingListContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? ownerNickname = null,
    Object? id = null,
    Object? createTimestamp = null,
    Object? shoppingItemCollection = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerNickname: null == ownerNickname
          ? _value.ownerNickname
          : ownerNickname // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createTimestamp: null == createTimestamp
          ? _value.createTimestamp
          : createTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingItemCollection: null == shoppingItemCollection
          ? _value.shoppingItemCollection
          : shoppingItemCollection // ignore: cast_nullable_to_non_nullable
              as ShoppingItemCollection,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ShoppingListContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingItemCollectionCopyWith<$Res> get shoppingItemCollection {
    return $ShoppingItemCollectionCopyWith<$Res>(_value.shoppingItemCollection,
        (value) {
      return _then(_value.copyWith(shoppingItemCollection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingListContainerImplCopyWith<$Res>
    implements $ShoppingListContainerCopyWith<$Res> {
  factory _$$ShoppingListContainerImplCopyWith(
          _$ShoppingListContainerImpl value,
          $Res Function(_$ShoppingListContainerImpl) then) =
      __$$ShoppingListContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ownerId,
      String ownerNickname,
      String id,
      int createTimestamp,
      ShoppingItemCollection shoppingItemCollection,
      String? name});

  @override
  $ShoppingItemCollectionCopyWith<$Res> get shoppingItemCollection;
}

/// @nodoc
class __$$ShoppingListContainerImplCopyWithImpl<$Res>
    extends _$ShoppingListContainerCopyWithImpl<$Res,
        _$ShoppingListContainerImpl>
    implements _$$ShoppingListContainerImplCopyWith<$Res> {
  __$$ShoppingListContainerImplCopyWithImpl(_$ShoppingListContainerImpl _value,
      $Res Function(_$ShoppingListContainerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingListContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? ownerNickname = null,
    Object? id = null,
    Object? createTimestamp = null,
    Object? shoppingItemCollection = null,
    Object? name = freezed,
  }) {
    return _then(_$ShoppingListContainerImpl(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerNickname: null == ownerNickname
          ? _value.ownerNickname
          : ownerNickname // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createTimestamp: null == createTimestamp
          ? _value.createTimestamp
          : createTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingItemCollection: null == shoppingItemCollection
          ? _value.shoppingItemCollection
          : shoppingItemCollection // ignore: cast_nullable_to_non_nullable
              as ShoppingItemCollection,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShoppingListContainerImpl implements _ShoppingListContainer {
  const _$ShoppingListContainerImpl(
      {required this.ownerId,
      required this.ownerNickname,
      required this.id,
      required this.createTimestamp,
      required this.shoppingItemCollection,
      this.name});

  factory _$ShoppingListContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListContainerImplFromJson(json);

  @override
  final String ownerId;
  @override
  final String ownerNickname;
  @override
  final String id;
  @override
  final int createTimestamp;
  @override
  final ShoppingItemCollection shoppingItemCollection;
  @override
  final String? name;

  @override
  String toString() {
    return 'ShoppingListContainer(ownerId: $ownerId, ownerNickname: $ownerNickname, id: $id, createTimestamp: $createTimestamp, shoppingItemCollection: $shoppingItemCollection, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListContainerImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerNickname, ownerNickname) ||
                other.ownerNickname == ownerNickname) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createTimestamp, createTimestamp) ||
                other.createTimestamp == createTimestamp) &&
            (identical(other.shoppingItemCollection, shoppingItemCollection) ||
                other.shoppingItemCollection == shoppingItemCollection) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ownerId, ownerNickname, id,
      createTimestamp, shoppingItemCollection, name);

  /// Create a copy of ShoppingListContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListContainerImplCopyWith<_$ShoppingListContainerImpl>
      get copyWith => __$$ShoppingListContainerImplCopyWithImpl<
          _$ShoppingListContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListContainerImplToJson(
      this,
    );
  }
}

abstract class _ShoppingListContainer implements ShoppingListContainer {
  const factory _ShoppingListContainer(
      {required final String ownerId,
      required final String ownerNickname,
      required final String id,
      required final int createTimestamp,
      required final ShoppingItemCollection shoppingItemCollection,
      final String? name}) = _$ShoppingListContainerImpl;

  factory _ShoppingListContainer.fromJson(Map<String, dynamic> json) =
      _$ShoppingListContainerImpl.fromJson;

  @override
  String get ownerId;
  @override
  String get ownerNickname;
  @override
  String get id;
  @override
  int get createTimestamp;
  @override
  ShoppingItemCollection get shoppingItemCollection;
  @override
  String? get name;

  /// Create a copy of ShoppingListContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingListContainerImplCopyWith<_$ShoppingListContainerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
