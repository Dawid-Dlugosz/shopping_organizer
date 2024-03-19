// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomUser customUser) loaded,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomUser customUser)? loaded,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomUser customUser)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_$Loaded value) loaded,
    required TResult Function(_$Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_$Loaded value)? loaded,
    TResult? Function(_$Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_$Loaded value)? loaded,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCubitStateCopyWith<$Res> {
  factory $UserCubitStateCopyWith(
          CustomUserState value, $Res Function(CustomUserState) then) =
      _$UserCubitStateCopyWithImpl<$Res, CustomUserState>;
}

/// @nodoc
class _$UserCubitStateCopyWithImpl<$Res, $Val extends CustomUserState>
    implements $UserCubitStateCopyWith<$Res> {
  _$UserCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserCubitStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'UserCubitState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomUser customUser) loaded,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomUser customUser)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomUser customUser)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_$Loaded value) loaded,
    required TResult Function(_$Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_$Loaded value)? loaded,
    TResult? Function(_$Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_$Loaded value)? loaded,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends CustomUserState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$$LoadedImplCopyWith<$Res> {
  factory _$$$LoadedImplCopyWith(
          _$$LoadedImpl value, $Res Function(_$$LoadedImpl) then) =
      __$$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomUser customUser});

  $CustomUserCopyWith<$Res> get customUser;
}

/// @nodoc
class __$$$LoadedImplCopyWithImpl<$Res>
    extends _$UserCubitStateCopyWithImpl<$Res, _$$LoadedImpl>
    implements _$$$LoadedImplCopyWith<$Res> {
  __$$$LoadedImplCopyWithImpl(
      _$$LoadedImpl _value, $Res Function(_$$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customUser = null,
  }) {
    return _then(_$$LoadedImpl(
      customUser: null == customUser
          ? _value.customUser
          : customUser // ignore: cast_nullable_to_non_nullable
              as CustomUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomUserCopyWith<$Res> get customUser {
    return $CustomUserCopyWith<$Res>(_value.customUser, (value) {
      return _then(_value.copyWith(customUser: value));
    });
  }
}

/// @nodoc

class _$$LoadedImpl extends _$Loaded {
  const _$$LoadedImpl({required this.customUser}) : super._();

  @override
  final CustomUser customUser;

  @override
  String toString() {
    return 'UserCubitState.loaded(customUser: $customUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$LoadedImpl &&
            (identical(other.customUser, customUser) ||
                other.customUser == customUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$LoadedImplCopyWith<_$$LoadedImpl> get copyWith =>
      __$$$LoadedImplCopyWithImpl<_$$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomUser customUser) loaded,
    required TResult Function(String? message) error,
  }) {
    return loaded(customUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomUser customUser)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(customUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomUser customUser)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(customUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_$Loaded value) loaded,
    required TResult Function(_$Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_$Loaded value)? loaded,
    TResult? Function(_$Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_$Loaded value)? loaded,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _$Loaded extends CustomUserState {
  const factory _$Loaded({required final CustomUser customUser}) =
      _$$LoadedImpl;
  const _$Loaded._() : super._();

  CustomUser get customUser;
  @JsonKey(ignore: true)
  _$$$LoadedImplCopyWith<_$$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$$ErrorImplCopyWith<$Res> {
  factory _$$$ErrorImplCopyWith(
          _$$ErrorImpl value, $Res Function(_$$ErrorImpl) then) =
      __$$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$$ErrorImplCopyWithImpl<$Res>
    extends _$UserCubitStateCopyWithImpl<$Res, _$$ErrorImpl>
    implements _$$$ErrorImplCopyWith<$Res> {
  __$$$ErrorImplCopyWithImpl(
      _$$ErrorImpl _value, $Res Function(_$$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$$ErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$$ErrorImpl extends _$Error {
  const _$$ErrorImpl({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'UserCubitState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ErrorImplCopyWith<_$$ErrorImpl> get copyWith =>
      __$$$ErrorImplCopyWithImpl<_$$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomUser customUser) loaded,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomUser customUser)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomUser customUser)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_$Loaded value) loaded,
    required TResult Function(_$Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_$Loaded value)? loaded,
    TResult? Function(_$Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_$Loaded value)? loaded,
    TResult Function(_$Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _$Error extends CustomUserState {
  const factory _$Error({final String? message}) = _$$ErrorImpl;
  const _$Error._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$$$ErrorImplCopyWith<_$$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
