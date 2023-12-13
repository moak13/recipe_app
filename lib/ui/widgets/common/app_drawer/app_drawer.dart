import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:stacked/stacked.dart';
import 'app_drawer_model.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AppDrawer extends StackedView<AppDrawerModel> {
  const AppDrawer({super.key});

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
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: context.palette!.primary11,
            ),
            accountName: RichText(
              text: TextSpan(
                text: viewModel.user?.firstname ?? '--',
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: viewModel.user?.lastName ?? '--',
                  ),
                ],
              ),
            ),
            accountEmail: Text(
              viewModel.user?.email ?? '--',
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
              style: context.typography?.titleBold16,
            ),
          ),
          ListTile(
            onTap: viewModel.navigateToSingleUserDish,
            leading: SvgPicture.asset(
              AppImages.gift,
              width: 24.7.w,
              height: 24.h,
            ),
            title: Text(
              S.current.my_dish,
              style: TextStyle(
                fontSize: 15.sp,
                color: context.palette?.gray11,
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
                color: context.palette?.gray11,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Platform.isIOS
                ? CupertinoSwitch(value: true, onChanged: (bool value) {})
                : Switch(
                    value: false,
                    onChanged: (bool value) {},
                  ),
          ),
          SizedBox(height: 10.h),
          Divider(thickness: 15.w, color: context.palette?.gray1),
          Spacer(),
          Divider(
            thickness: 10.w,
            color: context.palette?.gray1,
          ),
          ListTile(
            onTap: viewModel.logout,
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
