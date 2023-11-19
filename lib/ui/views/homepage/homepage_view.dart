import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/data_model/login_response.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/homepage/widgets/product_item.dart';
import 'package:receipe_app/ui/widgets/common/app_drawer/app_drawer.dart';
import 'package:stacked/stacked.dart';
import 'homepage_viewmodel.dart';

class HomepageView extends StackedView<HomepageViewModel> {
  // final LoginResponse? response;

  const HomepageView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomepageViewModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    final homeScaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: homeScaffoldKey,
      drawer: AppDrawer(response: viewModel.userDetails),
      appBar: AppBar(
        backgroundColor: kcBackground,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            homeScaffoldKey.currentState!.openDrawer();
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
          ),
        ),
        title: Text(
          S.current.home,
          style: typography?.titleBold16?.copyWith(color: palette?.gray11),
        ),
      ),
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
                    final product = viewModel.productItems.elementAt(index);
                    return ProductItem(
                      product: product,
                      onTap: () => viewModel.navigateToDishDetailsView(product),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.navigateToAddProduct();
        },
        //onPressed: viewModel.navigateToAddProduct(response),
        backgroundColor: palette!.primary6,
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
