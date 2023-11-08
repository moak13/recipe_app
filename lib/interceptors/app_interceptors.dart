import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/services/secure_storage_service.dart';
import 'package:receipe_app/ui/utilities/string_utils.dart';

class AppInterceptor extends Interceptor {
  final _secureStorageService = locator<SecureStorageService>();
  final _logger = getLogger('AppInterceptor');

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await _secureStorageService.readAccessToken();
    _logger.i("Token: $token");

    if (StringUtil.isNotEmpty(token)) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    options.headers.addAll({
      HttpHeaders.connectionHeader: 'keep-alive',
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    });

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    super.onError(err, handler);
  }
}
