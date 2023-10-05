import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/views/splash/widgets/curved_clipper.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(AppImages.blobOne),
          ),
          Image.asset(
            AppImages.splashLogo,
            width: 300,
            height: 200,
          ),
          Expanded(
            child: ClipPath(
              clipper: CurvedShapeClipper(),
              child: Image.asset(
                AppImages.splashImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    viewModel.runSplashLogic();
    super.onViewModelReady(viewModel);
  }

  @override
  SplashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashViewModel();
}
