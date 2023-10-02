import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/homepage/widgets/favourite_widget.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';

class DishTitle extends StatelessWidget {
  const DishTitle({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    late ThemeData theme = Theme.of(context);
    Palette? palette = theme.extension<Palette>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichTextWidget(
              color1: palette?.gray12,
              color2: palette?.gray12,
              text1: 'Name: ',
              fontWeight1: FontWeight.w300,
              text2: productModel.title,
              fontWeight2: FontWeight.w500,
              fontSize1: 14.sp,
              fontSize2: 16.sp,
            ),
            verticalSpaceSmall,
            RichTextWidget(
              color1: palette?.gray12,
              color2: palette?.gray12,
              text1: 'Date created: ',
              fontWeight1: FontWeight.w300,
              text2: productModel.date,
              fontWeight2: FontWeight.w500,
              fontSize1: 14.sp,
              fontSize2: 16.sp,
            ),
          ],
        ),
        FavoriteWidget(
          productModel: productModel,
          usePadding: false,
          color: kcIconBackground2,
        ),
      ],
    );
  }
}
