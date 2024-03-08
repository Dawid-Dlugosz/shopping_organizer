import 'package:flutter/widgets.dart';
import 'package:shopping_organizer/core/enums/firebase_auth_error.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthCubitUtils {
  static String getErrorText(String code, BuildContext context) {
    if (code == FirebaseAuthError.invalidEmail.code) {
      return AppLocalizations.of(context)!.invalidEmail;
    }
    if (code == FirebaseAuthError.userDisabled.code) {
      // TODO POPRAWIĆ TŁUMACZENIE
      return AppLocalizations.of(context)!.userDisabled;
    }
    if (code == FirebaseAuthError.userNotFound.code) {
      return AppLocalizations.of(context)!.userNotFound;
    }
    if (code == FirebaseAuthError.wrongPassword.code) {
      return AppLocalizations.of(context)!.wrongPassword;
    }
    return '';
  }
}
