import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.router.dart';
import 'package:receipe_app/data_model/slider_data.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends IndexTrackingViewModel {
  final _navigationService = locator<NavigationService>();

  List<SliderData> sliderItems = [
    SliderData(
      image: AppImages.onboardOne,
      title: S.current.onboarding_title_one,
      subtitle: S.current.onboarding_subtitle_one,
    ),
    SliderData(
      image: AppImages.onboardTwo,
      title: S.current.onboarding_title_two,
      subtitle: S.current.onboarding_subtitle_two,
    ),
    SliderData(
      image: AppImages.onboardThree,
      title: S.current.onboarding_title_three,
      subtitle: S.current.onboarding_subtitle_three,
    ),
  ];

  void getStarted() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
