import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {

  bool hideText = true;

  void toggleVisibility() {
    hideText = !hideText;
    rebuildUi();
  }

  void actionRouteToSignUpView() {}
}
