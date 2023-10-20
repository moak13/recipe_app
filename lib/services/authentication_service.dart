import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/login_model.dart';
import 'package:receipe_app/data_model/register_model.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/services/dio_service.dart';

class AuthenticationService {
  final _logger = getLogger('AuthenticationService');
  final _dioService = locator<DioService>();

  Future login({
    LoginModel? loginModel,
  }) async {
    try {
      final response = await _dioService.post(
        path: '/user/login',
        data: loginModel!.toJson(),
      );
      _logger.i('loginResponse: $response');
      return response['access_token'];
    } on RecipeException {
      _logger.e('Application Error trying to login a user');
      rethrow;
    } catch (e, s) {
      _logger.e('Error trying to login a user', e, s);
    }
  }

  Future<User?> register(RegisterModel registerModel) async {
    try {
      final response = await _dioService.post(
        path: '/user/register',
        data: registerModel.toJSON(),
      );
      _logger.i('register response: $response');
      return User.fromJson(response);
    } on RecipeException {
      _logger.e('Application Error trying to register a user');
      rethrow;
    } catch (e, s) {
      _logger.e('Error trying to register a user', e, s);
      return null;
    }
  }
}
