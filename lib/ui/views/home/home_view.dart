import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/home/widgets/product_item.dart';
import 'package:receipe_app/ui/widgets/common/app_drawer/app_drawer.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    final homeScaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: homeScaffoldKey,
      drawer: AppDrawer(),
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
            Builder(
              builder: (context) {
                // Loading
                if (viewModel.isBusy) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                // Error
                if (viewModel.hasError) {
                  return Center(
                    child: Text(viewModel.modelMessage ?? ''),
                  );
                }

                // Empty
                if (viewModel.data == null || viewModel.data!.isEmpty) {
                  return Center(
                    child: Text('There are no available dish to view currently'),
                  );
                }

                // Loaded
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.90,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 16.w,
                      ),
                      itemCount: viewModel.data?.length,
                      itemBuilder: (context, index) {
                        final recipe = viewModel.data?.elementAt(index);
                        return ProductItem(
                          recipe: recipe,
                          onTap: () => viewModel.navigateToDishDetailsView(recipe),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.navigateToAddProduct,
        backgroundColor: palette!.primary6,
        child: SvgPicture.asset(AppImages.addcon),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
