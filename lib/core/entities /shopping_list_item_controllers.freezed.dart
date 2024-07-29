// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_item_controllers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingListItemControllers {
  TextEditingController get nameController =>
      throw _privateConstructorUsedError;
  TextEditingController get quantityController =>
      throw _privateConstructorUsedError;
  ImagePicker get imagePicker => throw _privateConstructorUsedError;
  String? get imageLocalPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingListItemControllersCopyWith<ShoppingListItemControllers>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListItemControllersCopyWith<$Res> {
  factory $ShoppingListItemControllersCopyWith(
          ShoppingListItemControllers value,
          $Res Function(ShoppingListItemControllers) then) =
      _$ShoppingListItemControllersCopyWithImpl<$Res,
          ShoppingListItemControllers>;
  @useResult
  $Res call(
      {TextEditingController nameController,
      TextEditingController quantityController,
      ImagePicker imagePicker,
      String? imageLocalPath});
}

/// @nodoc
class _$ShoppingListItemControllersCopyWithImpl<$Res,
        $Val extends ShoppingListItemControllers>
    implements $ShoppingListItemControllersCopyWith<$Res> {
  _$ShoppingListItemControllersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$ShoppingListItemControllersImplCopyWith<$Res>
    implements $ShoppingListItemControllersCopyWith<$Res> {
  factory _$$ShoppingListItemControllersImplCopyWith(
          _$ShoppingListItemControllersImpl value,
          $Res Function(_$ShoppingListItemControllersImpl) then) =
      __$$ShoppingListItemControllersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController nameController,
      TextEditingController quantityController,
      ImagePicker imagePicker,
      String? imageLocalPath});
}

/// @nodoc
class __$$ShoppingListItemControllersImplCopyWithImpl<$Res>
    extends _$ShoppingListItemControllersCopyWithImpl<$Res,
        _$ShoppingListItemControllersImpl>
    implements _$$ShoppingListItemControllersImplCopyWith<$Res> {
  __$$ShoppingListItemControllersImplCopyWithImpl(
      _$ShoppingListItemControllersImpl _value,
      $Res Function(_$ShoppingListItemControllersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameController = null,
    Object? quantityController = null,
    Object? imagePicker = null,
    Object? imageLocalPath = freezed,
  }) {
    return _then(_$ShoppingListItemControllersImpl(
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

class _$ShoppingListItemControllersImpl
    implements _ShoppingListItemControllers {
  const _$ShoppingListItemControllersImpl(
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
    return 'ShoppingListItemControllers(nameController: $nameController, quantityController: $quantityController, imagePicker: $imagePicker, imageLocalPath: $imageLocalPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListItemControllersImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListItemControllersImplCopyWith<_$ShoppingListItemControllersImpl>
      get copyWith => __$$ShoppingListItemControllersImplCopyWithImpl<
          _$ShoppingListItemControllersImpl>(this, _$identity);
}

abstract class _ShoppingListItemControllers
    implements ShoppingListItemControllers {
  const factory _ShoppingListItemControllers(
      {required final TextEditingController nameController,
      required final TextEditingController quantityController,
      required final ImagePicker imagePicker,
      final String? imageLocalPath}) = _$ShoppingListItemControllersImpl;

  @override
  TextEditingController get nameController;
  @override
  TextEditingController get quantityController;
  @override
  ImagePicker get imagePicker;
  @override
  String? get imageLocalPath;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListItemControllersImplCopyWith<_$ShoppingListItemControllersImpl>
      get copyWith => throw _privateConstructorUsedError;
}
