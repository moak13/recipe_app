import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/utilities/string_utils.dart';
import 'package:receipe_app/ui/widgets/common/dish_image/widgets/no_dish_image.dart';
import 'package:stacked/stacked.dart';

import 'dish_image_model.dart';

class DishImage extends StackedView<DishImageModel> {
  final String imageUrl;
  const DishImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget builder(
    BuildContext context,
    DishImageModel viewModel,
    Widget? child,
  ) {
    if (StringUtil.isEmpty(imageUrl)) {
      return NoDishImage();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return SkeletonLoader(
          loading: true,
          child: Container(
            height: 300.h,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return NoDishImage();
      },
    );
  }

  @override
  DishImageModel viewModelBuilder(
    BuildContext context,
  ) =>
      DishImageModel();
}
