import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runSplashLogic() async {
    await Future.delayed(Duration(seconds: 2));
    _navigationService.replaceWithOnboardingView();
  }
}
