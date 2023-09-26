import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/widgets/common/appbar/custom_app_bar_model.dart';
import 'package:stacked/stacked.dart';

import '../../../extension/app_typography.dart';
import '../../../extension/palette.dart';
import '../primary_button/primary_button_model.dart';

class CustomAppBar extends StackedView<CustomAppBarModel> {
  final String titleText;
  final VoidCallback? onTap;
  final Widget? title;
  
  const CustomAppBar({
    super.key,
    required this.titleText,
    this.onTap,
    this.title, 
  });

  @override
  Widget builder(
    BuildContext context,
    CustomAppBarModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return 
    
   AppBar(
leading: InkWell(  
    onTap: onTap ??
                () {
                //  Todo Navigate to open drawer
                },
                child: SvgPicture.asset(AppImages.burgerLogo, height: 24.h,width: 24.h,),
                 ),

                     automaticallyImplyLeading: true,
                     backgroundColor:  Colors.white,
                     title: Padding(
      padding: EdgeInsets.only(top: 5.0.h),
      child:  title ??   Text(
              titleText,
                style: typography?.titleBold16?.copyWith(
                  color: palette?.gray11,
                ),
              ),
       
    ),


   );
      
       
  }

  @override
  CustomAppBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomAppBarModel();
}
