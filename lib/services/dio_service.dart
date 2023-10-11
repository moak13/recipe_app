import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "",
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
    } on DioException {
      rethrow;
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
    } on DioException {
      rethrow;
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
    } on DioException {
      rethrow;
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
    } on DioException {
      rethrow;
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
    } on DioException {
      rethrow;
    }
  }
}
