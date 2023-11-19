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
    _logger.i('deleting user');

    try {
      await _databaseService.clearUserData();
      _logger.i('User deleted');
    } catch (e) {
      _logger.e('error deleting user', e);
    }
  }

  Future<void> _getUser() async {
    _logger.i('Getting user from DB');
    try {
      final User? authUser = await _databaseService.authenticatedUser();
      if (authUser == null) return;
      _user.value = authUser;
      notifyListeners();
      _logger.i('User gotten from DB');
    } catch (e) {
      _logger.e('error in getting user - No user found');
    }
  }

  Future<void> saveUser(User? user) async {
    _logger.i('Saving user to DB');
    try {
      if (user == null) return;

      user.isLoggedIn = 0;
      await _databaseService.mergeUser(user);
      _logger.i('User saved to DB');
    } catch (e) {
      _logger.e('error in saving user');
    } finally {
      _logger.i('refetching user');
      await _getUser();
    }
  }
}
