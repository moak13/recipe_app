import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/edit_dish/edit_dish_viewmodel.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';

class EditDishView extends StatelessWidget {
  const EditDishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

    return ViewModelBuilder<EditDishViewModel>.nonReactive(
      viewModelBuilder: () => EditDishViewModel(),
      builder: (
        BuildContext context,
        EditDishViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            foregroundColor: palette?.gray12,
            backgroundColor: Colors.white,
            title: Text(
              'Edit Dish',
              style: typography?.titleBold16?.copyWith(
                color: palette?.gray12,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                children: [
                  Text(
                    'Kindly edit the details below to the reflect the right standard dish information',
                    style: typography?.labelRegular14?.copyWith(
                      color: palette?.gray8,
                    ),
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name of Dish',
                      hintText: 'Name of Dish',
                    ),
                  ),
                  16.verticalSpace,
                  TextFormField(
                    maxLines: 15,
                    decoration: InputDecoration(
                      labelText: 'Instructions',
                      hintText: 'Instructions',
                    ),
                  ),
                  16.verticalSpace,
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ingredients',
                      hintText: 'Ingredients',
                    ),
                  ),
                  100.verticalSpace,
                  PrimaryButton(
                    buttonText: 'Edit Dish',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
