import 'package:path_provider/path_provider.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

class DatabaseService {
  final _logger = getLogger('DatabaseService');
  final _databaseMigrationService = locator<DatabaseMigrationService>();

  late final Database database;

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
}
