import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/services/database_service.dart';
import 'package:stacked/stacked.dart';

class UserService with ListenableServiceMixin {
  final _databaseService = locator<DatabaseService>();
  final _logger = getLogger('UserService');

  UserService() {
    _getUser();
    listenToReactiveValues([_user]);
  }

  ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  User? get user => _user.value;

  Future<void> delete() async {
    _logger.i('delete user');

    try {
      await _databaseService.clearUserData();
    } catch (e) {
      _logger.e('error deleting user', e);
    }
  }

  Future<void> _getUser() async {
    try {
      final User? authUser = await _databaseService.authenticatedUser();
      if (authUser == null) return;
      _user.value = authUser;
      notifyListeners();
    } catch (e) {
      _logger.e('error in getting user');
    }
  }

  Future<void> saveUser(User? user) async {
    try {
      if (user == null) return;

      user.isLoggedIn = 1;
      await _databaseService.mergeUser(user);
    } catch (e) {
      _logger.e('error in saving user');
    } finally {
      _logger.i('refetching user');
      await _getUser();
    }
  }
}
