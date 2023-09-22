import 'package:flutter/material.dart';
import 'package:receipe_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends FormViewModel {
  
  bool hideText = true;

  void toggleVisibility() {
    hideText = !hideText;
    rebuildUi();
  }

  void login() {
    debugPrint(emailValue);
    debugPrint(passwordValue);
  }

  void actionRouteToSignUpView() {
    debugPrint("====here====");
  }
}
