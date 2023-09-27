import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/views/homepage/widgets/product_item.dart';
import 'package:receipe_app/ui/widgets/common/custom_appbar/custom_appbar.dart';
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
      appBar: customAppBar(context, titleText: 'Home'),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: SizedBox(
                  // height: 400.h,
                  child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 171.w / 252.h,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 16.w,
                  mainAxisExtent: 252.h,
                ),
                itemCount: viewModel.productItems().length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    productModel: viewModel.productItems()[index],
                  );
                },
              )),
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
