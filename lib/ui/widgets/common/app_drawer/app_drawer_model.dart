import 'package:receipe_app/services/authentication_service.dart';
import 'package:receipe_app/services/user_service.dart';
import 'package:receipe_app/ui/common/app_themes.dart';
import 'package:stacked/stacked.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';

import 'package:stacked_services/stacked_services.dart';

class AppDrawerModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _authenticationService = locator<AuthenticationService>();

  final _logger = getLogger('App_Drawer');

// @override
//   // TODO: implement listenableServices

//   List<ListenableServiceMixin> _listenableServices = [];
//   List<ListenableServiceMixin> get listenableServices => _listenableServices;

  //ListenableServiceMixin _value = ListenableServiceMixin(//)
  // listenToReactiveValues([_user]);//

  // listenToReactiveValues([_user]);//

  // ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  // User? get user => _user.value;

  bool _currentThemeValue = false;

  bool get currentThemeValue => _currentThemeValue;

  void setCurrentTheme(bool value) {
    // print(':::$value:::');
    _logger.d(value);
    _currentThemeValue = value;

    // if (value == true) {
    //   AppThemes.lightTheme;
    // } else {
    //   AppThemes.darkTheme;
    // }
    rebuildUi();
  }

  void navigateToHome() {
    _navigationService.back();
  }

  void navigateToHomefromNewDish() {
    //-> 1
    //Would involve me passing response<LoginResponse> to my VM
    //which looked so not possible - (may be it is sha) but
    //I tried and i saw moving data from the widget - 'AppDrawer' view,
    //To it's VM wasnt ideal

    //_navigationService.navigateToHomepageView(response: response)

    //->2
    //DOPE ASS NAVIGATION - Does not work properly
    _navigationService.popRepeated(2);
  }
}

void logOut() {
  // _userService.delete();

  // QUESTION -> Does not even work
  /// _userService.delete();
}
