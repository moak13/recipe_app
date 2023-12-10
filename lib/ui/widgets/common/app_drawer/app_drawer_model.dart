import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/services/secure_storage_service.dart';
import 'package:receipe_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';

import 'package:stacked_services/stacked_services.dart';

class AppDrawerModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _secureStorageService = locator<SecureStorageService>();

  User? get user => _userService.user;

  final _logger = getLogger('App_Drawer');

  void navigateToHome() {
    _logger.i("go back");
    _navigationService.replaceWithHomeView();
  }

  void navigateToHomefromNewDish() {
    _navigationService.popRepeated(2);
  }

  void navigateToSingleUserDish() {
    _navigationService.replaceWithSingleUserView();
  }

  Future<void> logout() async {
    await _userService.delete();
    await _secureStorageService.deleteAccessToken();
    await _secureStorageService.deleteRefreshToken();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
