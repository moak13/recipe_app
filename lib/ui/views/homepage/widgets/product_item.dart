import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

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
    return Card(
      elevation: 0,
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
                width: double.infinity,
              ),
              Builder(builder: (context) {
                if (productModel.isLiked) {
                  return Padding(
                    padding: EdgeInsets.all(12.0.h),
                    child: SvgPicture.asset(AppImages.unLikedIcon),
                  );
                }
                return Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: SvgPicture.asset(AppImages.lkedIcon),
                );
              })
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Name: ',
                textAlign: TextAlign.center,
                style: typography?.labelRegular12?.copyWith(
                  color: palette?.gray8,
                ),
              ),
              Text(
                productModel.title,
                textAlign: TextAlign.center,
                style: typography?.labelRegular12?.copyWith(
                  color: palette?.primary6,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Date Created: ',
                textAlign: TextAlign.center,
                style: typography?.labelRegular12?.copyWith(
                  color: palette?.gray8,
                ),
              ),
              Text(
                productModel.date,
                textAlign: TextAlign.center,
                style: typography?.labelRegular12?.copyWith(
                  color: palette?.gray11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LikedWidget extends StatelessWidget {
  const LikedWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.h),
      child: Image.asset(
        productModel.image,
        height: 20.h,
      ),
    );
  }
}
