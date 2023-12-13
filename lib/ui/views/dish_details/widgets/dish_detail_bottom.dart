import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/recipe.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/dish_title.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/ingredient_container.dart';
import 'package:stacked/stacked.dart';

class DishDetailBottom extends ViewModelWidget<DishDetailsViewModel> {
  const DishDetailBottom({
    super.key,
    required this.recipe,
  });

  final Recipe? recipe;

  @override
  Widget build(BuildContext context, DishDetailsViewModel viewModel) {
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
              DishTitle(recipe: recipe),
              verticalSpaceMedium,
              Text(
                S.current.ingredients,
                style: context.typography?.titleBold16?.copyWith(
                  color: context.palette?.gray12,
                ),
              ),
              SizedBox(height: 12.h),
              // This shows the list of ingredients of a selected dish

              Builder(builder: (context) {
                if (recipe?.ingredients == null ||
                    recipe!.ingredients!.isEmpty) {
                  return Text('No Ingredents available');
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: recipe!.ingredients!
                      .map(
                        (aDishIngredient) => IngredientContainer(
                          content: aDishIngredient,
                        ),
                      )
                      .toList(),
                );
              }),

              SizedBox(height: 25.h),
              Text(
                S.current.instructions,
                style: context.typography?.titleBold16?.copyWith(
                  color: context.palette?.gray12,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                recipe?.instructions ?? '--',
                style: context.typography?.labelRegular12?.copyWith(
                  color: context.palette?.gray12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
