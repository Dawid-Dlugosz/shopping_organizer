// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_user_shop_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomUserShopList _$CustomUserShopListFromJson(Map<String, dynamic> json) {
  return _CustomUserShopList.fromJson(json);
}

/// @nodoc
mixin _$CustomUserShopList {
  String get ownerId => throw _privateConstructorUsedError;
  String get listId => throw _privateConstructorUsedError;
  bool get isAcceptInvite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomUserShopListCopyWith<CustomUserShopList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomUserShopListCopyWith<$Res> {
  factory $CustomUserShopListCopyWith(
          CustomUserShopList value, $Res Function(CustomUserShopList) then) =
      _$CustomUserShopListCopyWithImpl<$Res, CustomUserShopList>;
  @useResult
  $Res call({String ownerId, String listId, bool isAcceptInvite});
}

/// @nodoc
class _$CustomUserShopListCopyWithImpl<$Res, $Val extends CustomUserShopList>
    implements $CustomUserShopListCopyWith<$Res> {
  _$CustomUserShopListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? listId = null,
    Object? isAcceptInvite = null,
  }) {
    return _then(_value.copyWith(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      isAcceptInvite: null == isAcceptInvite
          ? _value.isAcceptInvite
          : isAcceptInvite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomUserShopListImplCopyWith<$Res>
    implements $CustomUserShopListCopyWith<$Res> {
  factory _$$CustomUserShopListImplCopyWith(_$CustomUserShopListImpl value,
          $Res Function(_$CustomUserShopListImpl) then) =
      __$$CustomUserShopListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ownerId, String listId, bool isAcceptInvite});
}

/// @nodoc
class __$$CustomUserShopListImplCopyWithImpl<$Res>
    extends _$CustomUserShopListCopyWithImpl<$Res, _$CustomUserShopListImpl>
    implements _$$CustomUserShopListImplCopyWith<$Res> {
  __$$CustomUserShopListImplCopyWithImpl(_$CustomUserShopListImpl _value,
      $Res Function(_$CustomUserShopListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? listId = null,
    Object? isAcceptInvite = null,
  }) {
    return _then(_$CustomUserShopListImpl(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      isAcceptInvite: null == isAcceptInvite
          ? _value.isAcceptInvite
          : isAcceptInvite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomUserShopListImpl implements _CustomUserShopList {
  const _$CustomUserShopListImpl(
      {required this.ownerId,
      required this.listId,
      required this.isAcceptInvite});

  factory _$CustomUserShopListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomUserShopListImplFromJson(json);

  @override
  final String ownerId;
  @override
  final String listId;
  @override
  final bool isAcceptInvite;

  @override
  String toString() {
    return 'CustomUserShopList(ownerId: $ownerId, listId: $listId, isAcceptInvite: $isAcceptInvite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomUserShopListImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.listId, listId) || other.listId == listId) &&
            (identical(other.isAcceptInvite, isAcceptInvite) ||
                other.isAcceptInvite == isAcceptInvite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ownerId, listId, isAcceptInvite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomUserShopListImplCopyWith<_$CustomUserShopListImpl> get copyWith =>
      __$$CustomUserShopListImplCopyWithImpl<_$CustomUserShopListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomUserShopListImplToJson(
      this,
    );
  }
}

abstract class _CustomUserShopList implements CustomUserShopList {
  const factory _CustomUserShopList(
      {required final String ownerId,
      required final String listId,
      required final bool isAcceptInvite}) = _$CustomUserShopListImpl;

  factory _CustomUserShopList.fromJson(Map<String, dynamic> json) =
      _$CustomUserShopListImpl.fromJson;

  @override
  String get ownerId;
  @override
  String get listId;
  @override
  bool get isAcceptInvite;
  @override
  @JsonKey(ignore: true)
  _$$CustomUserShopListImplCopyWith<_$CustomUserShopListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
