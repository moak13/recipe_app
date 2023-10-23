import 'package:receipe_app/app/app.logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _logger = getLogger('SecureStorageService');
  String _accesskey = 'access_token';
  String _refreshkey = 'refresh_token';
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future<void> deleteAccessToken() async {
    try {
      await _flutterSecureStorage.delete(key: _accesskey);
    } catch (e, s) {
      _logger.e('error trying to delete access token', e, s);
    }
  }

  Future<void> deleteRefreshToken() async {
    try {
      await _flutterSecureStorage.delete(key: _refreshkey);
    } catch (e, s) {
      _logger.e('error trying to delete refresh token', e, s);
    }
  }

  Future<String?> readAccessToken() async {
    try {
      return await _flutterSecureStorage.read(key: _accesskey);
    } catch (e, s) {
      _logger.e('error trying to read access token', e, s);
      return null;
    }
  }

  Future<String?> readRefreshToken() async {
    try {
      return await _flutterSecureStorage.read(key: _refreshkey);
    } catch (e, s) {
      _logger.e('error trying to read refresh token', e, s);
      return null;
    }
  }

  Future<void> writeAccessToken({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _accesskey, value: token);
    } catch (e, s) {
      _logger.e('error trying to write access token', e, s);
    }
  }

  Future<void> writeRefreshToken({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _refreshkey, value: token);
    } catch (e, s) {
      _logger.e('error trying to write refresh token', e, s);
    }
  }
}
