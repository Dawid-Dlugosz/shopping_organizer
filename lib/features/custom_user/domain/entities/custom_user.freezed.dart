// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomUser _$CustomUserFromJson(Map<String, dynamic> json) {
  return _CustomUser.fromJson(json);
}

/// @nodoc
mixin _$CustomUser {
  String get fcmToken => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<CustomUserShopList> get shoppingLists =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomUserCopyWith<CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomUserCopyWith<$Res> {
  factory $CustomUserCopyWith(
          CustomUser value, $Res Function(CustomUser) then) =
      _$CustomUserCopyWithImpl<$Res, CustomUser>;
  @useResult
  $Res call(
      {String fcmToken, String userId, List<CustomUserShopList> shoppingLists});
}

/// @nodoc
class _$CustomUserCopyWithImpl<$Res, $Val extends CustomUser>
    implements $CustomUserCopyWith<$Res> {
  _$CustomUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
    Object? userId = null,
    Object? shoppingLists = null,
  }) {
    return _then(_value.copyWith(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingLists: null == shoppingLists
          ? _value.shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<CustomUserShopList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomUserImplCopyWith<$Res>
    implements $CustomUserCopyWith<$Res> {
  factory _$$CustomUserImplCopyWith(
          _$CustomUserImpl value, $Res Function(_$CustomUserImpl) then) =
      __$$CustomUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fcmToken, String userId, List<CustomUserShopList> shoppingLists});
}

/// @nodoc
class __$$CustomUserImplCopyWithImpl<$Res>
    extends _$CustomUserCopyWithImpl<$Res, _$CustomUserImpl>
    implements _$$CustomUserImplCopyWith<$Res> {
  __$$CustomUserImplCopyWithImpl(
      _$CustomUserImpl _value, $Res Function(_$CustomUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
    Object? userId = null,
    Object? shoppingLists = null,
  }) {
    return _then(_$CustomUserImpl(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingLists: null == shoppingLists
          ? _value._shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<CustomUserShopList>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CustomUserImpl implements _CustomUser {
  const _$CustomUserImpl(
      {required this.fcmToken,
      required this.userId,
      required final List<CustomUserShopList> shoppingLists})
      : _shoppingLists = shoppingLists;

  factory _$CustomUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomUserImplFromJson(json);

  @override
  final String fcmToken;
  @override
  final String userId;
  final List<CustomUserShopList> _shoppingLists;
  @override
  List<CustomUserShopList> get shoppingLists {
    if (_shoppingLists is EqualUnmodifiableListView) return _shoppingLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingLists);
  }

  @override
  String toString() {
    return 'CustomUser(fcmToken: $fcmToken, userId: $userId, shoppingLists: $shoppingLists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomUserImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._shoppingLists, _shoppingLists));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken, userId,
      const DeepCollectionEquality().hash(_shoppingLists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomUserImplCopyWith<_$CustomUserImpl> get copyWith =>
      __$$CustomUserImplCopyWithImpl<_$CustomUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomUserImplToJson(
      this,
    );
  }
}

abstract class _CustomUser implements CustomUser {
  const factory _CustomUser(
          {required final String fcmToken,
          required final String userId,
          required final List<CustomUserShopList> shoppingLists}) =
      _$CustomUserImpl;

  factory _CustomUser.fromJson(Map<String, dynamic> json) =
      _$CustomUserImpl.fromJson;

  @override
  String get fcmToken;
  @override
  String get userId;
  @override
  List<CustomUserShopList> get shoppingLists;
  @override
  @JsonKey(ignore: true)
  _$$CustomUserImplCopyWith<_$CustomUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
