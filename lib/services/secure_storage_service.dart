import 'package:receipe_app/app/app.logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _logger = getLogger('SecureStorageService');
  String _key = 'token';
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future<void> deleteToken() async {
    try {
      await _flutterSecureStorage.delete(key: _key);
    } catch (e, s) {
      _logger.e('error trying to delete token', e, s);
    }
  }

  Future<String?> readToken() async {
    try {
      return await _flutterSecureStorage.read(key: _key);
    } catch (e, s) {
      _logger.e('error trying to read token', e, s);
      return null;
    }
  }

  Future<void> writeToken({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _key, value: token);
    } catch (e, s) {
      _logger.e('error trying to write token', e, s);
    }
  }
}
