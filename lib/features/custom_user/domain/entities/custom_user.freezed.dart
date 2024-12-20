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
  String get nickname => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get maxListCount => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  List<String> get shoppingLists => throw _privateConstructorUsedError;

  /// Serializes this CustomUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {String nickname,
      String fcmToken,
      String userId,
      int maxListCount,
      bool isPremium,
      List<String> shoppingLists});
}

/// @nodoc
class _$CustomUserCopyWithImpl<$Res, $Val extends CustomUser>
    implements $CustomUserCopyWith<$Res> {
  _$CustomUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? fcmToken = null,
    Object? userId = null,
    Object? maxListCount = null,
    Object? isPremium = null,
    Object? shoppingLists = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      maxListCount: null == maxListCount
          ? _value.maxListCount
          : maxListCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      shoppingLists: null == shoppingLists
          ? _value.shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {String nickname,
      String fcmToken,
      String userId,
      int maxListCount,
      bool isPremium,
      List<String> shoppingLists});
}

/// @nodoc
class __$$CustomUserImplCopyWithImpl<$Res>
    extends _$CustomUserCopyWithImpl<$Res, _$CustomUserImpl>
    implements _$$CustomUserImplCopyWith<$Res> {
  __$$CustomUserImplCopyWithImpl(
      _$CustomUserImpl _value, $Res Function(_$CustomUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? fcmToken = null,
    Object? userId = null,
    Object? maxListCount = null,
    Object? isPremium = null,
    Object? shoppingLists = null,
  }) {
    return _then(_$CustomUserImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      maxListCount: null == maxListCount
          ? _value.maxListCount
          : maxListCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      shoppingLists: null == shoppingLists
          ? _value._shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CustomUserImpl implements _CustomUser {
  const _$CustomUserImpl(
      {required this.nickname,
      required this.fcmToken,
      required this.userId,
      this.maxListCount = 4,
      this.isPremium = false,
      final List<String> shoppingLists = const []})
      : _shoppingLists = shoppingLists;

  factory _$CustomUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomUserImplFromJson(json);

  @override
  final String nickname;
  @override
  final String fcmToken;
  @override
  final String userId;
  @override
  @JsonKey()
  final int maxListCount;
  @override
  @JsonKey()
  final bool isPremium;
  final List<String> _shoppingLists;
  @override
  @JsonKey()
  List<String> get shoppingLists {
    if (_shoppingLists is EqualUnmodifiableListView) return _shoppingLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingLists);
  }

  @override
  String toString() {
    return 'CustomUser(nickname: $nickname, fcmToken: $fcmToken, userId: $userId, maxListCount: $maxListCount, isPremium: $isPremium, shoppingLists: $shoppingLists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomUserImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.maxListCount, maxListCount) ||
                other.maxListCount == maxListCount) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            const DeepCollectionEquality()
                .equals(other._shoppingLists, _shoppingLists));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      fcmToken,
      userId,
      maxListCount,
      isPremium,
      const DeepCollectionEquality().hash(_shoppingLists));

  /// Create a copy of CustomUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String nickname,
      required final String fcmToken,
      required final String userId,
      final int maxListCount,
      final bool isPremium,
      final List<String> shoppingLists}) = _$CustomUserImpl;

  factory _CustomUser.fromJson(Map<String, dynamic> json) =
      _$CustomUserImpl.fromJson;

  @override
  String get nickname;
  @override
  String get fcmToken;
  @override
  String get userId;
  @override
  int get maxListCount;
  @override
  bool get isPremium;
  @override
  List<String> get shoppingLists;

  /// Create a copy of CustomUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomUserImplCopyWith<_$CustomUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
