import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:receipe_app/ui/views/home/widgets/liked_widget.dart';
import 'package:receipe_app/ui/views/home/widgets/unliked_widget.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({
    super.key,
    required this.product,
    this.usePadding = true,
    this.color,
  });

  final ProductModel product;
  final bool? usePadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: usePadding == true ? EdgeInsets.all(8.0.r) : EdgeInsets.zero,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: color ?? context.palette?.iconBackground,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Builder(builder: (context) {
          if (product.isLiked) {
            return LikedWidget();
          }
          return UnlikedWidget();
        }),
      ),
    );
  }
}
