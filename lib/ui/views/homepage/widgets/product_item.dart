import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/homepage/widgets/liked_widget.dart';
import 'package:receipe_app/ui/views/homepage/widgets/unliked_widget.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return SizedBox(
      height: 252.h,
      width: 171.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.asset(
                productModel.image,
                height: 200.h,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    color: kcIconBackground,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Builder(builder: (context) {
                    if (productModel.isLiked) {
                      return LikedWidget();
                    }
                    return UnlikedWidget();
                  }),
                ),
              )
            ],
          ),
          SizedBox(height: 8.h),
          Text.rich(
            TextSpan(
                text: 'Name: ',
                style: typography?.labelRegular12?.copyWith(
                  color: palette?.gray8,
                  fontSize: 12.sp,
                  height: 1.57,
                ),
                children: [
                  TextSpan(
                    text: productModel.title,
                    style: typography?.labelRegular12?.copyWith(
                      color: palette?.primary6,
                      fontSize: 12.sp,
                      height: 1.57,
                    ),
                  ),
                ]),
          ),
          Text.rich(
            TextSpan(
                text: 'Date: Created: ',
                style: typography?.labelRegular12?.copyWith(
                  color: palette?.gray8,
                  fontSize: 12.sp,
                  height: 1.57,
                ),
                children: [
                  TextSpan(
                    text: productModel.date,
                    style: typography?.labelRegular12?.copyWith(
                      color: palette?.gray11,
                      fontSize: 12.sp,
                      height: 1.57,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
