import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  Future runSplashLogic() async {
    await Future.delayed(Duration(seconds: 2));
    User? user = _userService.user;

    if (user == null) {
      _navigationService.replaceWithOnboardingView();
      return;
    }

    _navigationService.replaceWithHomeView();
  }
}
