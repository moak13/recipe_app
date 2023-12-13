import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/data_model/recipe.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
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
    return Stack(
      children: [
        Image.network(
          recipe?.dishImageUrl ??
              'https://media.istockphoto.com/id/1404501005/photo/jollof-rice.jpg?s=1024x1024&w=is&k=20&c=DTns3r_STc4HRBMouVl8IgHeuWhnBdz8X4DRkbDxWjQ=',
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
            color: context.palette?.popUpBg,
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
                      true => context.typography?.labelMedium16,
                      false => context.typography?.labelMedium16?.copyWith(
                          color: context.palette?.redShade,
                        ),
                    },
                  ),
                ),
              )
            ],
            icon: CircleAvatar(
              radius: 20.r,
              backgroundColor: context.palette?.iconBackground3,
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
