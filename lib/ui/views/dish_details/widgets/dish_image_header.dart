import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/recipe.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:stacked/stacked.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/views/dish_details/dish_details_viewmodel.dart';

class DishImageHeader extends ViewModelWidget<DishDetailsViewModel> {
  final Recipe? recipe;
  const DishImageHeader({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context, DishDetailsViewModel viewModel) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

    return Stack(
      children: [
        Image.asset(
          recipe?.dishImageUrl ?? '',
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
            color: palette?.popUpBg,
            itemBuilder: (context) => [
              ...viewModel.popUpMenuItems.entries.map(
                (entry) => PopupMenuItem(
                  value: entry.key,
                  onTap: () => switch (entry.key == 1) {
                    true => viewModel.navigateToEditView(),
                    false => viewModel.showDeleteDishDialog(),
                  },
                  child: Text(
                    entry.value,
                    style: switch (entry.key == 1) {
                      true => typography?.labelMedium16,
                      false => typography?.labelMedium16?.copyWith(
                          color: palette?.redShade,
                        ),
                    },
                  ),
                ),
              )
            ],
            icon: CircleAvatar(
              radius: 20.r,
              backgroundColor: palette?.iconBackground3,
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
