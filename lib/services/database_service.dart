import 'package:path_provider/path_provider.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

class DatabaseService {
  final _logger = getLogger('DatabaseService');
  final _databaseMigrationService = locator<DatabaseMigrationService>();

  late final Database database;

  final String _userTable = 'user';

  Future<void> init() async {
    _logger.i('database initialize');
    final directory = await getApplicationDocumentsDirectory();
    database = await openDatabase(
      '${directory.path}/recipe_app',
      version: 1,
    );
    try {
      _logger.i('creating DB tables');

      // Apply migration on every start
      await _databaseMigrationService.runMigration(
        database,
        migrationFiles: [
          '1_recipe_app.sql',
        ],
        verbose: true,
      );

      _logger.i('DB tables created');
    } catch (e, s) {
      _logger.v('error creating DB tables', e, s);
    }
  }

  Future<void> _storeUserData(User user) async {
    _logger.i('storing user data');
    try {
      await database.insert(
        _userTable,
        user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      _logger.i('user data stored');
    } catch (e) {
      _logger.e('error trying to store a user data');
    }
  }

  Future<User?> _getUserData(int? userId) async {
    _logger.i('getting user data');

    try {
      var records = await database.query(
        _userTable,
        where: "id = ?",
        whereArgs: [userId],
      );

      if ((records).isEmpty) {
        _logger.e('no record found');

        return null;
      }
      _logger.i('user data fetched');

      return User.fromJson(records.first);
    } catch (e) {
      _logger.e('error getting user data', e);
      return null;
    }
  }

  Future<void> _updateUserData(User user) async {
    _logger.i('updating user data');

    try {
      await database.update(
        _userTable,
        user.toJson(),
        where: "id = ?",
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      _logger.i('user data updated');
    } catch (e) {
      _logger.e('error updating user data', e);
    }
  }

  Future<void> clearUserData() async {
    _logger.i('deleting user data');

    try {
      await database.delete(_userTable);
      _logger.i('deleted user data');
    } catch (e) {
      _logger.e('error deleting user data', e);
    }
  }

  Future<void> mergeUser(User user) async {
    _logger.i('merging user data');

    try {
      User? current = await _getUserData(user.id);
      if (current != null) {
        await _updateUserData(user);
      } else {
        await _storeUserData(user);
      }
    } catch (e) {
      _logger.e('error merging user data', e);
    }
  }

  Future<User?> authenticatedUser() async {
    _logger.i('getting auth user data');

    try {
      var records = await database.query(
        _userTable,
        where: "isLoggedIn = ?",
        whereArgs: [1],
      );
      if ((records).isEmpty) {
        _logger.e('no record found');

        return null;
      }
      _logger.i('auth user data gotten');

      return User.fromJson(records.last);
    } catch (e, s) {
      _logger.e('error getting auth user record', e, s);
      return null;
    }
  }
}
