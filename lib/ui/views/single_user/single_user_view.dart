import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:receipe_app/ui/views/home/widgets/product_item.dart';
import 'package:receipe_app/ui/widgets/common/app_drawer/app_drawer.dart';
import 'package:receipe_app/ui/widgets/common/overlay_loader/overlay_loader.dart';
import 'package:stacked/stacked.dart';
import 'single_user_viewmodel.dart';

class SingleUserView extends StackedView<SingleUserViewModel> {
  const SingleUserView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleUserViewModel viewModel,
    Widget? child,
  ) {
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
          S.current.mydish,
          style: context.typography?.titleBold16
              ?.copyWith(color: context.palette?.gray11),
        ),
      ),
      body: SafeArea(
        child: OverlayLoader(
          isBusy: viewModel.isBusy,
          content: Column(
            children: [
              SizedBox(
                height: 18.h,
              ),
              Builder(
                builder: (context) {
                  //Error
                  if (viewModel.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          Lottie.asset(
                            AppImages.noDishFound,
                            width: 200,
                            height: 200,
                          ),
                          Text(
                            viewModel.modelMessage ?? S.current.unknown_error,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                  //Data not yet ready
                  if (!viewModel.dataReady) {
                    return Align(
                      heightFactor: 20,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        viewModel.modelMessage ??
                            S.current.generate_recipe_contents,
                      ),
                    );
                  }

                  // Empty
                  if (viewModel.data == null || viewModel.data!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            AppImages.noDishFound,
                            width: 200,
                            height: 200,
                          ),
                          Text(S.current.no_dish_available),
                        ],
                      ),
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
                            onTap: () {},
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
      ),
    );
  }

  @override
  SingleUserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleUserViewModel();
}
