import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/error_model.dart';
import 'package:receipe_app/exceptions/receipe_exceptions.dart';
import 'package:receipe_app/generated/l10n.dart';

class DioService {
  late final Dio _dio;
  final _logger = getLogger('DioService');

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://kally-dish-recipe.onrender.com",
        connectTimeout: Duration(seconds: 30),
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.addAll([
        LogInterceptor(
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
      ]);
    }
  }

  Future post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        throw RecipeException(message: S.current.no_internet);
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw RecipeException(message: S.current.connection_timeout);
      }

      if (e.response?.statusCode == 500) {
        throw RecipeException(message: S.current.service_unavailable);
      }

      throw RecipeException(
          message: ErrorModel.fromJson(e.response?.data).message ??
              S.current.unknown_error);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        throw RecipeException(message: S.current.no_internet);
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw RecipeException(message: S.current.connection_timeout);
      }

      if (e.response?.statusCode == 500) {
        throw RecipeException(message: S.current.service_unavailable);
      }

      throw RecipeException(
          message: ErrorModel.fromJson(e.response?.data).message ??
              S.current.unknown_error);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        throw RecipeException(message: S.current.no_internet);
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw RecipeException(message: S.current.connection_timeout);
      }

      if (e.response?.statusCode == 500) {
        throw RecipeException(message: S.current.service_unavailable);
      }

      throw RecipeException(
          message: ErrorModel.fromJson(e.response?.data).message ??
              S.current.unknown_error);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future patch({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        throw RecipeException(message: S.current.no_internet);
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw RecipeException(message: S.current.connection_timeout);
      }

      if (e.response?.statusCode == 500) {
        throw RecipeException(message: S.current.service_unavailable);
      }

      throw RecipeException(
          message: ErrorModel.fromJson(e.response?.data).message ??
              S.current.unknown_error);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }

  Future delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        throw RecipeException(message: S.current.no_internet);
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw RecipeException(message: S.current.connection_timeout);
      }

      if (e.response?.statusCode == 500) {
        throw RecipeException(message: S.current.service_unavailable);
      }

      throw RecipeException(
          message: ErrorModel.fromJson(e.response?.data).message ??
              S.current.unknown_error);
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);
    }
  }
}
