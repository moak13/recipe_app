import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/data_model/login_model.dart';
import 'package:receipe_app/services/authentication_service.dart';
import 'package:receipe_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _logger = getLogger('LoginViewModel');
  bool hideText = true;

  void toggleVisibility() {
    hideText = !hideText;
    rebuildUi();
  }

  Future<void> login() async {
    setBusy(true);
    try {
      LoginModel loginModel = LoginModel(
        email: emailValue?.trim(),
        password: passwordValue?.trim(),
      );
      final response = await _authenticationService.login(
        loginModel: loginModel,
      );
    } on Exception catch (e) {
      _dialogService.showDialog(
        description: e.toString(),
      );
    } catch (e, s) {
      _logger.e('An error occurred while login in', e, s);
    } finally {
      setBusy(false);
    }
    // _navigationService.navigateToHomepageView();
  }

  void actionRouteToSignUpView() {
    _navigationService.navigateToSignupView();
  }
}
