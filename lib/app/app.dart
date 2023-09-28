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
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: OnboardingView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: SignupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: EventService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
