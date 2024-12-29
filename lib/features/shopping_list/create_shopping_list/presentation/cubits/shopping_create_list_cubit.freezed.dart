// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_create_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingCreateListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShoppingListContainer shoppingListContainer)
        added,
    required TResult Function(
            ShoppingListContainer shoppingListContainer, bool? error)
        created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShoppingListContainer shoppingListContainer)? added,
    TResult? Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShoppingListContainer shoppingListContainer)? added,
    TResult Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Added value) added,
    required TResult Function(_Created value) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Added value)? added,
    TResult? Function(_Created value)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Added value)? added,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCreateListStateCopyWith<$Res> {
  factory $ShoppingCreateListStateCopyWith(ShoppingCreateListState value,
          $Res Function(ShoppingCreateListState) then) =
      _$ShoppingCreateListStateCopyWithImpl<$Res, ShoppingCreateListState>;
}

/// @nodoc
class _$ShoppingCreateListStateCopyWithImpl<$Res,
        $Val extends ShoppingCreateListState>
    implements $ShoppingCreateListStateCopyWith<$Res> {
  _$ShoppingCreateListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ShoppingCreateListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'ShoppingCreateListState.initial()';
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
    required TResult Function() loading,
    required TResult Function(ShoppingListContainer shoppingListContainer)
        added,
    required TResult Function(
            ShoppingListContainer shoppingListContainer, bool? error)
        created,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShoppingListContainer shoppingListContainer)? added,
    TResult? Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShoppingListContainer shoppingListContainer)? added,
    TResult Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Added value) added,
    required TResult Function(_Created value) created,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Added value)? added,
    TResult? Function(_Created value)? created,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Added value)? added,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends ShoppingCreateListState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ShoppingCreateListStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'ShoppingCreateListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShoppingListContainer shoppingListContainer)
        added,
    required TResult Function(
            ShoppingListContainer shoppingListContainer, bool? error)
        created,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShoppingListContainer shoppingListContainer)? added,
    TResult? Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShoppingListContainer shoppingListContainer)? added,
    TResult Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Added value) added,
    required TResult Function(_Created value) created,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Added value)? added,
    TResult? Function(_Created value)? created,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Added value)? added,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends ShoppingCreateListState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$AddedImplCopyWith<$Res> {
  factory _$$AddedImplCopyWith(
          _$AddedImpl value, $Res Function(_$AddedImpl) then) =
      __$$AddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShoppingListContainer shoppingListContainer});

  $ShoppingListContainerCopyWith<$Res> get shoppingListContainer;
}

/// @nodoc
class __$$AddedImplCopyWithImpl<$Res>
    extends _$ShoppingCreateListStateCopyWithImpl<$Res, _$AddedImpl>
    implements _$$AddedImplCopyWith<$Res> {
  __$$AddedImplCopyWithImpl(
      _$AddedImpl _value, $Res Function(_$AddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingListContainer = null,
  }) {
    return _then(_$AddedImpl(
      shoppingListContainer: null == shoppingListContainer
          ? _value.shoppingListContainer
          : shoppingListContainer // ignore: cast_nullable_to_non_nullable
              as ShoppingListContainer,
    ));
  }

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingListContainerCopyWith<$Res> get shoppingListContainer {
    return $ShoppingListContainerCopyWith<$Res>(_value.shoppingListContainer,
        (value) {
      return _then(_value.copyWith(shoppingListContainer: value));
    });
  }
}

/// @nodoc

class _$AddedImpl extends _Added {
  const _$AddedImpl({required this.shoppingListContainer}) : super._();

  @override
  final ShoppingListContainer shoppingListContainer;

  @override
  String toString() {
    return 'ShoppingCreateListState.added(shoppingListContainer: $shoppingListContainer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedImpl &&
            (identical(other.shoppingListContainer, shoppingListContainer) ||
                other.shoppingListContainer == shoppingListContainer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shoppingListContainer);

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedImplCopyWith<_$AddedImpl> get copyWith =>
      __$$AddedImplCopyWithImpl<_$AddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShoppingListContainer shoppingListContainer)
        added,
    required TResult Function(
            ShoppingListContainer shoppingListContainer, bool? error)
        created,
  }) {
    return added(shoppingListContainer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShoppingListContainer shoppingListContainer)? added,
    TResult? Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
  }) {
    return added?.call(shoppingListContainer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShoppingListContainer shoppingListContainer)? added,
    TResult Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(shoppingListContainer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Added value) added,
    required TResult Function(_Created value) created,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Added value)? added,
    TResult? Function(_Created value)? created,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Added value)? added,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _Added extends ShoppingCreateListState {
  const factory _Added(
          {required final ShoppingListContainer shoppingListContainer}) =
      _$AddedImpl;
  const _Added._() : super._();

  ShoppingListContainer get shoppingListContainer;

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddedImplCopyWith<_$AddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatedImplCopyWith<$Res> {
  factory _$$CreatedImplCopyWith(
          _$CreatedImpl value, $Res Function(_$CreatedImpl) then) =
      __$$CreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShoppingListContainer shoppingListContainer, bool? error});

  $ShoppingListContainerCopyWith<$Res> get shoppingListContainer;
}

/// @nodoc
class __$$CreatedImplCopyWithImpl<$Res>
    extends _$ShoppingCreateListStateCopyWithImpl<$Res, _$CreatedImpl>
    implements _$$CreatedImplCopyWith<$Res> {
  __$$CreatedImplCopyWithImpl(
      _$CreatedImpl _value, $Res Function(_$CreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingListContainer = null,
    Object? error = freezed,
  }) {
    return _then(_$CreatedImpl(
      shoppingListContainer: null == shoppingListContainer
          ? _value.shoppingListContainer
          : shoppingListContainer // ignore: cast_nullable_to_non_nullable
              as ShoppingListContainer,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingListContainerCopyWith<$Res> get shoppingListContainer {
    return $ShoppingListContainerCopyWith<$Res>(_value.shoppingListContainer,
        (value) {
      return _then(_value.copyWith(shoppingListContainer: value));
    });
  }
}

/// @nodoc

class _$CreatedImpl extends _Created {
  const _$CreatedImpl({required this.shoppingListContainer, this.error})
      : super._();

  @override
  final ShoppingListContainer shoppingListContainer;
  @override
  final bool? error;

  @override
  String toString() {
    return 'ShoppingCreateListState.created(shoppingListContainer: $shoppingListContainer, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedImpl &&
            (identical(other.shoppingListContainer, shoppingListContainer) ||
                other.shoppingListContainer == shoppingListContainer) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shoppingListContainer, error);

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedImplCopyWith<_$CreatedImpl> get copyWith =>
      __$$CreatedImplCopyWithImpl<_$CreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShoppingListContainer shoppingListContainer)
        added,
    required TResult Function(
            ShoppingListContainer shoppingListContainer, bool? error)
        created,
  }) {
    return created(shoppingListContainer, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShoppingListContainer shoppingListContainer)? added,
    TResult? Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
  }) {
    return created?.call(shoppingListContainer, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShoppingListContainer shoppingListContainer)? added,
    TResult Function(ShoppingListContainer shoppingListContainer, bool? error)?
        created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(shoppingListContainer, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Added value) added,
    required TResult Function(_Created value) created,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Added value)? added,
    TResult? Function(_Created value)? created,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Added value)? added,
    TResult Function(_Created value)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created extends ShoppingCreateListState {
  const factory _Created(
      {required final ShoppingListContainer shoppingListContainer,
      final bool? error}) = _$CreatedImpl;
  const _Created._() : super._();

  ShoppingListContainer get shoppingListContainer;
  bool? get error;

  /// Create a copy of ShoppingCreateListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedImplCopyWith<_$CreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
