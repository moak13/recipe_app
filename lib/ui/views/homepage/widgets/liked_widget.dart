import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/ui/common/app_images.dart';

class LikedWidget extends StatelessWidget {
  const LikedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.w),
      child: SvgPicture.asset(AppImages.likedIcon),
    );
  }
}
