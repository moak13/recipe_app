import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/views/onboarding/widgets/dot_widget.dart';
import 'package:receipe_app/ui/views/onboarding/widgets/slider_content.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.splashLogo,
              height: 72.h,
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              height: 400.h,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  final sliderData = viewModel.sliderItems.elementAt(index);
                  return SliderContent(sliderData: sliderData);
                },
                onPageChanged: viewModel.setIndex,
                itemCount: viewModel.sliderItems.length,
              ),
            ),
            const Spacer(),
            DotWidget(
              index: viewModel.currentIndex,
              length: viewModel.sliderItems.length,
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: PrimaryButton(
                buttonText: S.current.get_started,
                onTap: viewModel.getStarted,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
