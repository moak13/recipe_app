import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/utilities/string_utils.dart';

class Validation {
  static String? validateEmail(String? s) {
    if (StringUtil.isEmpty(s)) {
      return S.current.email_cannot_be_empty;
    } else if (!StringUtil.isValidEmail(s!)) {
      return S.current.email_must_be_a_valid_email;
    } else {
      return null;
    }
  }

  static String? validateField(String? s, {String? errorMessage}) {
    if (StringUtil.isEmpty(s)) {
      return errorMessage ?? S.current.required;
    } else {
      return null;
    }
  }
}
