// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:sqflite_migration_service/src/database_migration_service.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/authentication_service.dart';
import '../services/database_service.dart';
import '../services/dio_service.dart';
import '../services/dish_service.dart';
import '../services/event_service.dart';
import '../services/secure_storage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => EventService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DishService());
  locator.registerLazySingleton(() => DatabaseMigrationService());
  final databaseService = DatabaseService();
  await databaseService.init();
  locator.registerSingleton(databaseService);
}
