import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/views/homepage/widgets/liked_widget.dart';
import 'package:receipe_app/ui/views/homepage/widgets/unliked_widget.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({
    super.key,
    required this.productModel,
    this.usePadding = true,
    this.color,
  });

  final ProductModel productModel;
  final bool? usePadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: usePadding == true ? EdgeInsets.all(8.0.w) : EdgeInsets.zero,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: color ?? kcIconBackground,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Builder(builder: (context) {
          if (productModel.isLiked) {
            return LikedWidget();
          }
          return UnlikedWidget();
        }),
      ),
    );
  }
}
