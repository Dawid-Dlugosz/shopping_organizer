// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingListItem _$ShoppingListItemFromJson(Map<String, dynamic> json) {
  return _ShoppingListItem.fromJson(json);
}

/// @nodoc
mixin _$ShoppingListItem {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get quantity => throw _privateConstructorUsedError;
  CountType get countType => throw _privateConstructorUsedError;
  String? get networkImagePath => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  String? get localImagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListItemCopyWith<ShoppingListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListItemCopyWith<$Res> {
  factory $ShoppingListItemCopyWith(
          ShoppingListItem value, $Res Function(ShoppingListItem) then) =
      _$ShoppingListItemCopyWithImpl<$Res, ShoppingListItem>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? quantity,
      CountType countType,
      String? networkImagePath,
      @JsonKey(includeFromJson: false) String? localImagePath});
}

/// @nodoc
class _$ShoppingListItemCopyWithImpl<$Res, $Val extends ShoppingListItem>
    implements $ShoppingListItemCopyWith<$Res> {
  _$ShoppingListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? countType = null,
    Object? networkImagePath = freezed,
    Object? localImagePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      countType: null == countType
          ? _value.countType
          : countType // ignore: cast_nullable_to_non_nullable
              as CountType,
      networkImagePath: freezed == networkImagePath
          ? _value.networkImagePath
          : networkImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      localImagePath: freezed == localImagePath
          ? _value.localImagePath
          : localImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingListItemImplCopyWith<$Res>
    implements $ShoppingListItemCopyWith<$Res> {
  factory _$$ShoppingListItemImplCopyWith(_$ShoppingListItemImpl value,
          $Res Function(_$ShoppingListItemImpl) then) =
      __$$ShoppingListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? quantity,
      CountType countType,
      String? networkImagePath,
      @JsonKey(includeFromJson: false) String? localImagePath});
}

/// @nodoc
class __$$ShoppingListItemImplCopyWithImpl<$Res>
    extends _$ShoppingListItemCopyWithImpl<$Res, _$ShoppingListItemImpl>
    implements _$$ShoppingListItemImplCopyWith<$Res> {
  __$$ShoppingListItemImplCopyWithImpl(_$ShoppingListItemImpl _value,
      $Res Function(_$ShoppingListItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? countType = null,
    Object? networkImagePath = freezed,
    Object? localImagePath = freezed,
  }) {
    return _then(_$ShoppingListItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      countType: null == countType
          ? _value.countType
          : countType // ignore: cast_nullable_to_non_nullable
              as CountType,
      networkImagePath: freezed == networkImagePath
          ? _value.networkImagePath
          : networkImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      localImagePath: freezed == localImagePath
          ? _value.localImagePath
          : localImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingListItemImpl extends _ShoppingListItem {
  const _$ShoppingListItemImpl(
      {required this.id,
      this.name,
      this.quantity,
      this.countType = CountType.piece,
      this.networkImagePath,
      @JsonKey(includeFromJson: false) this.localImagePath})
      : super._();

  factory _$ShoppingListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingListItemImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? quantity;
  @override
  @JsonKey()
  final CountType countType;
  @override
  final String? networkImagePath;
  @override
  @JsonKey(includeFromJson: false)
  final String? localImagePath;

  @override
  String toString() {
    return 'ShoppingListItem(id: $id, name: $name, quantity: $quantity, countType: $countType, networkImagePath: $networkImagePath, localImagePath: $localImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.countType, countType) ||
                other.countType == countType) &&
            (identical(other.networkImagePath, networkImagePath) ||
                other.networkImagePath == networkImagePath) &&
            (identical(other.localImagePath, localImagePath) ||
                other.localImagePath == localImagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, countType,
      networkImagePath, localImagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListItemImplCopyWith<_$ShoppingListItemImpl> get copyWith =>
      __$$ShoppingListItemImplCopyWithImpl<_$ShoppingListItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingListItemImplToJson(
      this,
    );
  }
}

abstract class _ShoppingListItem extends ShoppingListItem {
  const factory _ShoppingListItem(
          {required final String id,
          final String? name,
          final String? quantity,
          final CountType countType,
          final String? networkImagePath,
          @JsonKey(includeFromJson: false) final String? localImagePath}) =
      _$ShoppingListItemImpl;
  const _ShoppingListItem._() : super._();

  factory _ShoppingListItem.fromJson(Map<String, dynamic> json) =
      _$ShoppingListItemImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get quantity;
  @override
  CountType get countType;
  @override
  String? get networkImagePath;
  @override
  @JsonKey(includeFromJson: false)
  String? get localImagePath;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListItemImplCopyWith<_$ShoppingListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
