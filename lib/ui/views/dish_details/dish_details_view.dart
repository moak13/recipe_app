import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/product_model.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';
import 'package:receipe_app/ui/views/dish_details/widgets/ingredient_container.dart';
import 'package:receipe_app/ui/views/homepage/widgets/favourite_widget.dart';
import 'package:receipe_app/ui/widgets/common/richtext_widget.dart';
import 'package:stacked/stacked.dart';

class DishDetailsView extends StatelessWidget {
  const DishDetailsView({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    late ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();

    Palette? palette = theme.extension<Palette>();
    return ViewModelBuilder<DishDetailsViewModel>.reactive(
      viewModelBuilder: () => DishDetailsViewModel(),
      builder: (
        BuildContext context,
        DishDetailsViewModel viewModel,
        Widget? child,
      ) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: screenHeight(context) * .6,
                width: double.infinity,
                child: Image.asset(
                  productModel.image,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
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
                        vertical: 30.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Displays the first row of the ingredient body
                          /// It displays the name, date and the favorite icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichTextWidget(
                                    color1: palette?.gray12,
                                    color2: palette?.gray12,
                                    text1: 'Name: ',
                                    fontWeight1: FontWeight.w300,
                                    text2: productModel.title,
                                    fontWeight2: FontWeight.w500,
                                    fontSize1: 14.sp,
                                    fontSize2: 16.sp,
                                  ),
                                  verticalSpaceSmall,
                                  RichTextWidget(
                                    color1: palette?.gray12,
                                    color2: palette?.gray12,
                                    text1: 'Date created: ',
                                    fontWeight1: FontWeight.w300,
                                    text2: productModel.date,
                                    fontWeight2: FontWeight.w500,
                                    fontSize1: 14.sp,
                                    fontSize2: 16.sp,
                                  ),
                                ],
                              ),
                              FavoriteWidget(
                                productModel: productModel,
                                usePadding: false,
                                color: kcIconBackground2,
                              ),
                            ],
                          ),
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
                          ...viewModel.instructionsForADish.entries
                              .map(
                                (entry) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entry.key,
                                      style:
                                          typography?.labelRegular12?.copyWith(
                                        color: palette?.gray12,
                                      ),
                                    ),
                                    Text(
                                      entry.value,
                                      style:
                                          typography?.labelRegular12?.copyWith(
                                        color: palette?.gray12,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
