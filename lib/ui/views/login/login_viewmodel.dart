import 'package:flutter/material.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  bool hideText = true;

  void toggleVisibility() {
    hideText = !hideText;
    rebuildUi();
  }

  void login() {
    debugPrint(emailValue);
    debugPrint(passwordValue);
    //_navigationService.navigateToHomepageView();
  }

  void actionRouteToSignUpView() {
    //_navigationService.navigateToSignupView();
  }
   
}
