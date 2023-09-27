import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

PreferredSizeWidget 
customAppBar(
  BuildContext context, {
  String titleText = '',
  String leadText = '',
  VoidCallback? onTap,
  String text = '',
  Widget? title,
  double elevation = 0,
  double? fontSize,
  double? titleSpacing,
  bool automaticallyImplyLeading = true,
  Widget? leading,
  Color? backgroundColor,
  IconThemeData? iconThemeData,
  TabBar? bottom,
  List<Widget>? action,
  bool hasLeading = true,
  VoidCallback? onBackTap,
  double preferredSize = 56.0,
  bool centerTitle = true,
  Color? titleColor,
  FontWeight? fontWeight = FontWeight.bold,
}) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return  AppBar(
          backgroundColor: kcBackground,
          elevation: 0,
          leading: InkWell(
            onTap: onTap ??
                () {
                  
                  //  TODO open drawer
                  Drawer();
                },
            child: leading ??
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.0.w,
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
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5.0.h),
            child: title ??
                Text(
                  titleText,
                  style:
                      typography?.titleBold16?.copyWith(color: palette?.gray11),
                ),
          ))
    ;
  }
