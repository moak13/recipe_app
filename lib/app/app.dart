import 'package:receipe_app/ui/dialogs/delete_dish/delete_dish_dialog.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_view.dart';
import 'package:receipe_app/ui/views/edit_dish/edit_dish_view.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/event_service.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';
import 'package:receipe_app/ui/views/onboarding/onboarding_view.dart';
import 'package:receipe_app/ui/views/login/login_view.dart';
import 'package:receipe_app/ui/views/signup/signup_view.dart';
import 'package:receipe_app/ui/views/new_dish/new_dish_view.dart';
import 'package:receipe_app/services/secure_storage_service.dart';
import 'package:receipe_app/services/dio_service.dart';
import 'package:receipe_app/ui/views/splash/splash_view.dart';
import 'package:receipe_app/services/authentication_service.dart';
import 'package:receipe_app/services/dish_service.dart';
import 'package:receipe_app/services/database_service.dart';
import 'package:receipe_app/services/user_service.dart';
import 'package:receipe_app/ui/views/single_user/single_user_view.dart';
import 'package:receipe_app/services/image_picker_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: OnboardingView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: SignupView),
    AdaptiveRoute(page: DishDetailsView),
    AdaptiveRoute(page: EditDishView),
    AdaptiveRoute(page: NewDishView),
    AdaptiveRoute(page: SplashView),
    AdaptiveRoute(page: SingleUserView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: EventService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: DishService),
    LazySingleton(classType: DatabaseMigrationService),
    InitializableSingleton(classType: DatabaseService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: ImagePickerService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: DeleteDishDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
