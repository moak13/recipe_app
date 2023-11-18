import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/login_model.dart';
import 'package:receipe_app/data_model/login_response.dart';
import 'package:receipe_app/data_model/register_model.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/services/dio_service.dart';
import 'package:receipe_app/services/secure_storage_service.dart';
import 'package:receipe_app/services/user_service.dart';

class AuthenticationService {
  final _logger = getLogger('AuthenticationService');
  final _dioService = locator<DioService>();
  final _secureStorageService = locator<SecureStorageService>();
  final _userService = locator<UserService>();

  Future<LoginResponse?> login({
    LoginModel? loginModel,
  }) async {
    try {
      final response = await _dioService.post(
        path: '/user/login',
        data: loginModel!.toJson(),
      );
      final data = LoginResponse.fromJson(response);
      await _secureStorageService.writeAccessToken(
        token: data.credentials?.accessToken,
      );
      await _secureStorageService.writeRefreshToken(
        token: data.credentials?.refreshToken,
      );
      await _userService.saveUser(data.user);
      return data;
    } on RecipeException {
      _logger.e('Application Error trying to login a user');
      rethrow;
    } catch (e, s) {
      _logger.e('Error trying to login a user', e, s);
      rethrow;
    }
  }

  Future<User?> register(RegisterModel registerModel) async {
    try {
      final response = await _dioService.post(
        path: '/user/register',
        data: registerModel.toJSON(),
      );
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
