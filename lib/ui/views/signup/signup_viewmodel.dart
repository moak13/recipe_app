import 'package:flutter/material.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/ui/views/signup/signup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  bool hidePassword = true;

  void togglePassword() {
    hidePassword = !hidePassword;
    rebuildUi();
  }

  void actionRouteToLoginView() {
    _navigationService.navigateToLoginView();
  }

  void signup() {
    debugPrint(firstNameValue);
    debugPrint(lastNameValue);
    debugPrint(emailValue);
    debugPrint(passwordValue);
  }
}
