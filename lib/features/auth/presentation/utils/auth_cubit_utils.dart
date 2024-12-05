import 'package:flutter/widgets.dart';
import 'package:shopping_organizer/core/enums/firebase_auth_error.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthCubitUtils {
  static String getErrorText(String code, BuildContext context) {
    print('code: $code');
    if (code == FirebaseAuthError.invalidEmail.code) {
      return AppLocalizations.of(context)!.invalidEmail;
    } else if (code == FirebaseAuthError.userDisabled.code) {
      // TODO POPRAWIĆ TŁUMACZENIE
      return AppLocalizations.of(context)!.userDisabled;
    } else if (code == FirebaseAuthError.userNotFound.code) {
      return AppLocalizations.of(context)!.userNotFound;
    } else if (code == FirebaseAuthError.wrongPassword.code) {
      return AppLocalizations.of(context)!.wrongPassword;
    } else if (code == FirebaseAuthError.emailAlreadyInUse.code) {
      return AppLocalizations.of(context)!.emailInUse;
    }
    return '';
  }
}
