import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';

import 'homepage_viewmodel.dart';

class HomepageView extends StackedView<HomepageViewModel> {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomepageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.logo,
              height: 72.h,
            ),
            SizedBox(
              height: 32.h,
            ),
            // SizedBox(
            //   height: 400.h,
            //   child: PageView.builder(
            //     itemBuilder: (context, index) {
            //       final sliderData = viewModel.sliderItems.elementAt(index);
            //       return SliderContent(sliderData: sliderData);
            //     },
            //     onPageChanged: viewModel.setIndex,
            //     itemCount: viewModel.sliderItems.length,
            //   ),
            // ),
            const Spacer(),
     
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: PrimaryButton(
                buttonText: S.current.get_started,
                onTap: (){},
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
  HomepageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomepageViewModel();
}
