import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/dish_title.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/ingredient_container.dart';
import 'package:stacked/stacked.dart';

class DishDetailBottom extends ViewModelWidget<DishDetailsViewModel> {
  const DishDetailBottom({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context, DishDetailsViewModel viewModel) {
    late ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight(context) * .5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.r),
            topRight: Radius.circular(36.r),
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 30.0.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Displays the first row of the ingredient body
                /// It displays the name, date and the favorite icon
                DishTitle(productModel: productModel),
                verticalSpaceMedium,
                Text(
                  'Ingredients',
                  style: typography?.titleBold16?.copyWith(
                    color: palette?.gray12,
                  ),
                ),
                12.verticalSpace,
                // This shows the list of ingredients of a selected dish
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: viewModel.listOfIngredientContent
                      .map(
                        (aDishIngredient) => IngredientContainer(
                          content: aDishIngredient,
                        ),
                      )
                      .toList(),
                ),
                verticalSpaceMedium,
                Text(
                  'Instructions',
                  style: typography?.titleBold16?.copyWith(
                    color: palette?.gray12,
                  ),
                ),
                12.verticalSpace,

                /// This shows the List of instructions
                ...viewModel.instructionsForADish.entries.map(
                  (entry) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: typography?.labelRegular12?.copyWith(
                          color: palette?.gray12,
                        ),
                      ),
                      Text(
                        entry.value,
                        style: typography?.labelRegular12?.copyWith(
                          color: palette?.gray12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
