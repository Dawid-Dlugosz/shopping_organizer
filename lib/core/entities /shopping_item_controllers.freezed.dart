// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_controllers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingItemControllers {
  TextEditingController get nameController =>
      throw _privateConstructorUsedError;
  TextEditingController get quantityController =>
      throw _privateConstructorUsedError;
  ImagePicker get imagePicker => throw _privateConstructorUsedError;
  String? get imageLocalPath => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemControllers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemControllersCopyWith<ShoppingItemControllers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemControllersCopyWith<$Res> {
  factory $ShoppingItemControllersCopyWith(ShoppingItemControllers value,
          $Res Function(ShoppingItemControllers) then) =
      _$ShoppingItemControllersCopyWithImpl<$Res, ShoppingItemControllers>;
  @useResult
  $Res call(
      {TextEditingController nameController,
      TextEditingController quantityController,
      ImagePicker imagePicker,
      String? imageLocalPath});
}

/// @nodoc
class _$ShoppingItemControllersCopyWithImpl<$Res,
        $Val extends ShoppingItemControllers>
    implements $ShoppingItemControllersCopyWith<$Res> {
  _$ShoppingItemControllersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemControllers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameController = null,
    Object? quantityController = null,
    Object? imagePicker = null,
    Object? imageLocalPath = freezed,
  }) {
    return _then(_value.copyWith(
      nameController: null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      quantityController: null == quantityController
          ? _value.quantityController
          : quantityController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      imagePicker: null == imagePicker
          ? _value.imagePicker
          : imagePicker // ignore: cast_nullable_to_non_nullable
              as ImagePicker,
      imageLocalPath: freezed == imageLocalPath
          ? _value.imageLocalPath
          : imageLocalPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemControllersImplCopyWith<$Res>
    implements $ShoppingItemControllersCopyWith<$Res> {
  factory _$$ShoppingItemControllersImplCopyWith(
          _$ShoppingItemControllersImpl value,
          $Res Function(_$ShoppingItemControllersImpl) then) =
      __$$ShoppingItemControllersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController nameController,
      TextEditingController quantityController,
      ImagePicker imagePicker,
      String? imageLocalPath});
}

/// @nodoc
class __$$ShoppingItemControllersImplCopyWithImpl<$Res>
    extends _$ShoppingItemControllersCopyWithImpl<$Res,
        _$ShoppingItemControllersImpl>
    implements _$$ShoppingItemControllersImplCopyWith<$Res> {
  __$$ShoppingItemControllersImplCopyWithImpl(
      _$ShoppingItemControllersImpl _value,
      $Res Function(_$ShoppingItemControllersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemControllers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameController = null,
    Object? quantityController = null,
    Object? imagePicker = null,
    Object? imageLocalPath = freezed,
  }) {
    return _then(_$ShoppingItemControllersImpl(
      nameController: null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      quantityController: null == quantityController
          ? _value.quantityController
          : quantityController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      imagePicker: null == imagePicker
          ? _value.imagePicker
          : imagePicker // ignore: cast_nullable_to_non_nullable
              as ImagePicker,
      imageLocalPath: freezed == imageLocalPath
          ? _value.imageLocalPath
          : imageLocalPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ShoppingItemControllersImpl implements _ShoppingItemControllers {
  const _$ShoppingItemControllersImpl(
      {required this.nameController,
      required this.quantityController,
      required this.imagePicker,
      this.imageLocalPath});

  @override
  final TextEditingController nameController;
  @override
  final TextEditingController quantityController;
  @override
  final ImagePicker imagePicker;
  @override
  final String? imageLocalPath;

  @override
  String toString() {
    return 'ShoppingItemControllers(nameController: $nameController, quantityController: $quantityController, imagePicker: $imagePicker, imageLocalPath: $imageLocalPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemControllersImpl &&
            (identical(other.nameController, nameController) ||
                other.nameController == nameController) &&
            (identical(other.quantityController, quantityController) ||
                other.quantityController == quantityController) &&
            (identical(other.imagePicker, imagePicker) ||
                other.imagePicker == imagePicker) &&
            (identical(other.imageLocalPath, imageLocalPath) ||
                other.imageLocalPath == imageLocalPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nameController,
      quantityController, imagePicker, imageLocalPath);

  /// Create a copy of ShoppingItemControllers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemControllersImplCopyWith<_$ShoppingItemControllersImpl>
      get copyWith => __$$ShoppingItemControllersImplCopyWithImpl<
          _$ShoppingItemControllersImpl>(this, _$identity);
}

abstract class _ShoppingItemControllers implements ShoppingItemControllers {
  const factory _ShoppingItemControllers(
      {required final TextEditingController nameController,
      required final TextEditingController quantityController,
      required final ImagePicker imagePicker,
      final String? imageLocalPath}) = _$ShoppingItemControllersImpl;

  @override
  TextEditingController get nameController;
  @override
  TextEditingController get quantityController;
  @override
  ImagePicker get imagePicker;
  @override
  String? get imageLocalPath;

  /// Create a copy of ShoppingItemControllers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemControllersImplCopyWith<_$ShoppingItemControllersImpl>
      get copyWith => throw _privateConstructorUsedError;
}
