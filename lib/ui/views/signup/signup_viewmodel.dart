import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/data_model/register_model.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/services/authentication_service.dart';
import 'package:receipe_app/ui/views/signup/signup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _logger = getLogger('SignupViewModel');
  bool hidePassword = true;

  void togglePassword() {
    hidePassword = !hidePassword;
    rebuildUi();
  }

  void actionRouteToLoginView() {
    _navigationService.back();
  }

  Future<void> signup() async {
    setBusy(true);
    try {
      RegisterModel registerModel = RegisterModel()
        ..email = emailValue?.trim()
        ..firstName = firstNameValue?.trim()
        ..lastName = lastNameValue?.trim()
        ..password = passwordValue?.trim()
        ..phoneNumber = phoneNumberValue?.trim();

      final User? response =
          await _authenticationService.register(registerModel);

      if (response != null) {
        await _dialogService.showDialog(
          description: "Account created successfully.",
        );
      }
    } on RecipeException catch (e) {
      _dialogService.showDialog(
        description: e.message,
      );
    } catch (e, s) {
      _logger.e('An error occurred while register ', e, s);
    } finally {
      setBusy(false);
    }
  }
}
