// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String? code) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unAuthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String? code)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function(User user)? authorized,
    TResult Function(String? code)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$UnAuthorized value) unAuthorized,
    required TResult Function(_$Authorized value) authorized,
    required TResult Function(_$Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$UnAuthorized value)? unAuthorized,
    TResult? Function(_$Authorized value)? authorized,
    TResult? Function(_$Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$UnAuthorized value)? unAuthorized,
    TResult Function(_$Authorized value)? authorized,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$$UnAuthorizedImplCopyWith<$Res> {
  factory _$$$UnAuthorizedImplCopyWith(
          _$$UnAuthorizedImpl value, $Res Function(_$$UnAuthorizedImpl) then) =
      __$$$UnAuthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$$UnAuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$$UnAuthorizedImpl>
    implements _$$$UnAuthorizedImplCopyWith<$Res> {
  __$$$UnAuthorizedImplCopyWithImpl(
      _$$UnAuthorizedImpl _value, $Res Function(_$$UnAuthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$$UnAuthorizedImpl implements _$UnAuthorized {
  const _$$UnAuthorizedImpl();

  @override
  String toString() {
    return 'AuthState.unAuthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$$UnAuthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String? code) error,
  }) {
    return unAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unAuthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String? code)? error,
  }) {
    return unAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function(User user)? authorized,
    TResult Function(String? code)? error,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$UnAuthorized value) unAuthorized,
    required TResult Function(_$Authorized value) authorized,
    required TResult Function(_$Error value) error,
  }) {
    return unAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$UnAuthorized value)? unAuthorized,
    TResult? Function(_$Authorized value)? authorized,
    TResult? Function(_$Error value)? error,
  }) {
    return unAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$UnAuthorized value)? unAuthorized,
    TResult Function(_$Authorized value)? authorized,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(this);
    }
    return orElse();
  }
}

abstract class _$UnAuthorized implements AuthState {
  const factory _$UnAuthorized() = _$$UnAuthorizedImpl;
}

/// @nodoc
abstract class _$$$AuthorizedImplCopyWith<$Res> {
  factory _$$$AuthorizedImplCopyWith(
          _$$AuthorizedImpl value, $Res Function(_$$AuthorizedImpl) then) =
      __$$$AuthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$$AuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$$AuthorizedImpl>
    implements _$$$AuthorizedImplCopyWith<$Res> {
  __$$$AuthorizedImplCopyWithImpl(
      _$$AuthorizedImpl _value, $Res Function(_$$AuthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$$AuthorizedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$$AuthorizedImpl implements _$Authorized {
  const _$$AuthorizedImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authorized(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$AuthorizedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$AuthorizedImplCopyWith<_$$AuthorizedImpl> get copyWith =>
      __$$$AuthorizedImplCopyWithImpl<_$$AuthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String? code) error,
  }) {
    return authorized(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unAuthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String? code)? error,
  }) {
    return authorized?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function(User user)? authorized,
    TResult Function(String? code)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$UnAuthorized value) unAuthorized,
    required TResult Function(_$Authorized value) authorized,
    required TResult Function(_$Error value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$UnAuthorized value)? unAuthorized,
    TResult? Function(_$Authorized value)? authorized,
    TResult? Function(_$Error value)? error,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$UnAuthorized value)? unAuthorized,
    TResult Function(_$Authorized value)? authorized,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _$Authorized implements AuthState {
  const factory _$Authorized({required final User user}) = _$$AuthorizedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$$AuthorizedImplCopyWith<_$$AuthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$$ErrorImplCopyWith<$Res> {
  factory _$$$ErrorImplCopyWith(
          _$$ErrorImpl value, $Res Function(_$$ErrorImpl) then) =
      __$$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? code});
}

/// @nodoc
class __$$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$$ErrorImpl>
    implements _$$$ErrorImplCopyWith<$Res> {
  __$$$ErrorImplCopyWithImpl(
      _$$ErrorImpl _value, $Res Function(_$$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_$$ErrorImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$$ErrorImpl implements _$Error {
  const _$$ErrorImpl({this.code});

  @override
  final String? code;

  @override
  String toString() {
    return 'AuthState.error(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ErrorImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ErrorImplCopyWith<_$$ErrorImpl> get copyWith =>
      __$$$ErrorImplCopyWithImpl<_$$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String? code) error,
  }) {
    return error(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unAuthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String? code)? error,
  }) {
    return error?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function(User user)? authorized,
    TResult Function(String? code)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$UnAuthorized value) unAuthorized,
    required TResult Function(_$Authorized value) authorized,
    required TResult Function(_$Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$UnAuthorized value)? unAuthorized,
    TResult? Function(_$Authorized value)? authorized,
    TResult? Function(_$Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$UnAuthorized value)? unAuthorized,
    TResult Function(_$Authorized value)? authorized,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _$Error implements AuthState {
  const factory _$Error({final String? code}) = _$$ErrorImpl;

  String? get code;
  @JsonKey(ignore: true)
  _$$$ErrorImplCopyWith<_$$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
