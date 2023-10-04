import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';
import 'package:receipe_app/ui/views/homepage/widgets/favourite_widget.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';
import 'package:stacked/stacked.dart';

class DishTitle extends ViewModelWidget<DishDetailsViewModel> {
  const DishTitle({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context, DishDetailsViewModel viewModel) {
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
              text1: S.current.name,
              fontWeight1: FontWeight.w300,
              text2: product.title,
              fontWeight2: FontWeight.w500,
              fontSize1: 14.sp,
              fontSize2: 16.sp,
            ),
            SizedBox(height:10.h),
            RichTextWidget(
              color1: palette?.gray12,
              color2: palette?.gray12,
              text1:S.current.date_created,
              fontWeight1: FontWeight.w300,
              text2: product.date,
              fontWeight2: FontWeight.w500,
              fontSize1: 14.sp,
              fontSize2: 16.sp,
            ),
          ],
        ),
        FavoriteWidget(
          product: product,
          usePadding: false,
          color: palette?.iconBackground2,
        ),
      ],
    );
  }
}
