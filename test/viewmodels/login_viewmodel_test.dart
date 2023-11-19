import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/data_model/login_model.dart';
import 'package:receipe_app/ui/views/login/login_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LoginViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('isBusy', () {
      test("test if login view model is not busy at init", () {
        final viewModel = LoginViewModel();
        expect(viewModel.isBusy, isFalse);
      });

      test("test if login view model is busy when login function is called ",
          () {
        var viewModel = LoginViewModel();
        viewModel.login();
        expect(viewModel.isBusy, isTrue);
      });
    });

    group('login', () {
      test('is authservice login is called when u tap login', () async {
        const fakeEmail = 'valid_email@filledstacks.com';
        const fakePassword = 'Password12';
        final mockAuthService = getAndRegisterAuthenticationService();

        final viewModel = LoginViewModel();
        viewModel.setData({'email': fakeEmail, 'password': fakePassword});

        await viewModel.login();
        verify(mockAuthService.login(
            loginModel: LoginModel(email: fakeEmail, password: fakePassword)));
      });
    });
  });
}
