import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:stacked/stacked.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';

class DishImageHeader extends ViewModelWidget<DishDetailsViewModel> {
  final ProductModel productModel;
  const DishImageHeader({
    required this.productModel,
  });
  @override
  Widget build(BuildContext context, DishDetailsViewModel viewModel) {
    late ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    return Stack(
      children: [
        Image.asset(
          productModel.image,
          fit: BoxFit.fill,
          height: screenHeight(context) * .6,
          width: double.infinity,
        ),
        Positioned(
          right: 10,
          top: 50,
          child: PopupMenuButton(
            offset: Offset(0.0, 45),
            padding: EdgeInsets.zero,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Color(0xFFF5F5F5),
            itemBuilder: (context) => [
              ...viewModel.popUpMenuItems.entries.map(
                (entry) => PopupMenuItem(
                  value: entry.key,
                  onTap: () => switch (entry.key == 1) {
                    true => viewModel.navigateToEditView(),
                    false => () {},
                  },
                  child: Text(
                    entry.value,
                    style: switch (entry.key == 1) {
                      true => typography?.labelMedium16,
                      false => typography?.labelMedium16?.copyWith(
                          color: kRedShadeColor,
                        ),
                    },
                  ),
                ),
              )
            ],
            icon: CircleAvatar(
              radius: 20.r,
              backgroundColor: kcIconBackground3,
              child: Icon(
                Icons.more_vert_outlined,
              ),
            ),
          ),
        )
      ],
    );
  }
}
