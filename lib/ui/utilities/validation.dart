import 'package:receipe_app/ui/utilities/string_utils.dart';

class Validation {
  static String? validateEmail(String? s) {
    if (StringUtil.isEmpty(s)) {
      return "Email cannot be empty";
    } else if (!StringUtil.isValidEmail(s!)) {
      return "Email must be a valid email address";
    } else {
      return null;
    }
  }

  static String? validateField(String? s, {String? errorMessage}) {
    if (StringUtil.isEmpty(s)) {
      return errorMessage ?? "Required";
    } else {
      return null;
    }
  }
}
