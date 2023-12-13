import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

/// The custom container that displays ingredients
class IngredientContainer extends ViewModelWidget<DishDetailsViewModel> {
  const IngredientContainer({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context, DishDetailsViewModel viewModel) {
    return Container(
      height: screenHeight(context) * .09,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: context.palette?.iconBackground2,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: SizedBox(
          width: screenWidth(context) * .15,
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: context.typography?.labelRegular12?.copyWith(
              color: context.palette?.gray12,
            ),
          ),
        ),
      ),
    );
  }
}
