import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/homepage/widgets/favourite_widget.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  const ProductItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Palette? palette = theme.extension<Palette>();
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
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
                  product.image,
                  height: 200.h,
                  fit: BoxFit.contain,
                ),
                FavoriteWidget(product: product)
              ],
            ),
            SizedBox(height: 8.h),
            RichTextWidget(
              color1: palette?.gray8,
              color2: palette?.primary6,
              text1: 'Name: ',
              text2: product.title,
            ),
            RichTextWidget(
              color1: palette?.gray8,
              color2: palette?.gray11,
              text1: 'Date Created: ',
              text2: product.date,
            ),
          ],
        ),
      ),
    );
  }
}
