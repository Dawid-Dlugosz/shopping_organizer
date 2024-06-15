import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_organizer/core/enums/custom_user_error.dart';

class CustomUserUtils {
  static String getErrorInformation(
    String message,
    BuildContext context,
  ) {
    if (message == CustomUserError.createFailure.code) {
      return AppLocalizations.of(context)!.userCreateError;
    } else if (message == CustomUserError.emptyUser.code) {
      return AppLocalizations.of(context)!.emptyUserError;
    } else if (message == CustomUserError.fcmError.code) {
      return AppLocalizations.of(context)!.unservicedError;
    }
    return AppLocalizations.of(context)!.unexpectedError;
  }
}
