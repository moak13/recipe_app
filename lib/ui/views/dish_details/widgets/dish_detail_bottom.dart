import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/generated/l10n.dart';
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
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context, DishDetailsViewModel viewModel) {
    ThemeData theme = Theme.of(context);
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 30.0.h,
            ),
            children: [
              /// Displays the first row of the ingredient body
              /// It displays the name, date and the favorite icon
              DishTitle(product: product),
              verticalSpaceMedium,
              Text(
                S.current.ingredients,
                style: typography?.titleBold16?.copyWith(
                  color: palette?.gray12,
                ),
              ),
              SizedBox(height: 12.h),
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
              SizedBox(height: 25.h),
              Text(
                S.current.instructions,
                style: typography?.titleBold16?.copyWith(
                  color: palette?.gray12,
                ),
              ),
              SizedBox(height: 12.h),

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
    );
  }
}
