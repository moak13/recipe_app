import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/data_model/user.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';
import 'package:stacked/stacked.dart';
import 'app_drawer_model.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

class AppDrawer extends StackedView<AppDrawerModel> {
  final User? response;

  const AppDrawer({super.key, required this.response});

  @override
  AppDrawerModel viewModelBuilder(
    BuildContext context,
  ) =>
      AppDrawerModel();

  @override
  Widget builder(
    BuildContext context,
    AppDrawerModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: palette!.primary11,
            ),
            accountName: RichTextWidget(
              text1: S.current.hi,
              text2: ', ${response!.firstname!} ${response!.lastName!}',
              color1: palette.white,
              color2: palette.white,
              fontSize1: 22.sp,
              fontSize2: 22.sp,
              fontWeight2: FontWeight.w600,
            ),
            accountEmail: Text(
              response!.email!,
            ),
          ),
          SizedBox(height: 20.h),
          ListTile(
            onTap: viewModel.navigateToHome,
            leading: SvgPicture.asset(
              AppImages.home,
              width: 24.7.w,
              height: 24.h,
            ),
            title: Text(
              S.current.drawer_home,
              style: typography?.titleBold16,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(
              AppImages.gift,
              width: 24.7.w,
              height: 24.h,
            ),
            title: Text(
              S.current.my_dish,
              style: TextStyle(
                fontSize: 15.sp,
                //color: AppColors.gray11,
                color: palette.gray11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(
              AppImages.moon,
              width: 24.7.w,
              height: 24.h,
            ),
            title: Text(
              S.current.dark_mode,
              style: TextStyle(
                fontSize: 15.sp,
                //color: AppColors.gray11,
                color: palette.gray11,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Platform.isIOS
                ? CupertinoSwitch(
                    value: viewModel.currentThemeValue,
                    onChanged: (bool value) {
                      viewModel.setCurrentTheme(value);
                    })
                : Switch(
                    value: viewModel.currentThemeValue,
                    onChanged: (bool value) {
                      viewModel.setCurrentTheme(value);
                    },
                  ),
          ),
          SizedBox(height: 10.h),
          Divider(
              thickness: 15.w,
              // color: AppColors.gray1,
              color: palette.gray1),
          Spacer(),
          Divider(
            thickness: 10.w,
            //color: AppColors.gray1,
            color: palette.gray1,
          ),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(
              AppImages.logout,
              width: 24.7.w,
              height: 24.h,
            ),
            title: Text(S.current.logout),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
