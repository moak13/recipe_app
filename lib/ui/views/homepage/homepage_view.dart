import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/homepage/widgets/product_item.dart';
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
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Scaffold(
      // appBar: customAppBar(context, titleText: 'Home'),
      appBar: AppBar(
          backgroundColor: kcBackground,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                //  TODO open drawer
                Drawer();
              },
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    top: 8.h,
                  ),
                  child: SvgPicture.asset(
                    AppImages.burgerLog,
                    width: 24.7.w,
                    height: 24.h,
                  ),
                ),
              )),
          title: Text(
            'Home',
            style: typography?.titleBold16?.copyWith(color: palette?.gray11),
          )),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.67,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 16.w,
                    mainAxisExtent: 252.h,
                  ),
                  itemCount: viewModel.productItems.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      productModel: viewModel.productItems.elementAt(index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.navigateToAddProduct,
        backgroundColor: AppColors.primary6,
        child: SvgPicture.asset(AppImages.addcon),
      ),
    );
  }

  @override
  HomepageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomepageViewModel();
}
