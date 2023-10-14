import 'package:dio/dio.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/error_model.dart';
import 'package:receipe_app/data_model/login_model.dart';
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
      return response;
    } on DioException catch (e, s) {
      _logger.e('Application Error trying to login a user', e, s);

      throw Exception(ErrorModel.fromJson(e.response?.data).message);
    } catch (e, s) {
      _logger.e('Error trying to login a user', e, s);
    }
  }
}
