import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.auth({required String message}) = _$Auth;
  const factory Failure.general({String? message}) = _$General;
}
