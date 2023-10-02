import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:receipe_app/ui/views/edit_dish/edit_dish_view.form.dart';
import 'package:receipe_app/ui/views/edit_dish/edit_dish_viewmodel.dart';
import 'package:receipe_app/ui/views/edit_dish/widget/ingredient_chip.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'ingredients'),
])
class EditDishView extends StatelessWidget with $EditDishView {
  const EditDishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

    return ViewModelBuilder<EditDishViewModel>.reactive(
      viewModelBuilder: () => EditDishViewModel(),
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
      builder: (
        BuildContext context,
        EditDishViewModel viewModel,
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
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Instructions',
                      hintText: 'Instructions',
                    ),
                  ),
                  16.verticalSpace,
                  TextFormField(
                    controller: ingredientsController,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (input) =>
                        viewModel.addTextFieldInputToList(input),
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Ingredients',
                      hintText: 'Ingredients',
                    ),
                  ),
                  verticalSpaceTiny,
                  AnimatedOpacity(
                    opacity: viewModel.allIngredients.isEmpty ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      children: const [
                        Text('Click "Done" after your input.'),
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    clipBehavior: Clip.antiAlias,
                    children: [
                      for (var ingredientIndex = 0;
                          ingredientIndex < viewModel.allIngredients.length;
                          ingredientIndex++)
                        IngredientChip(
                          content: viewModel.allIngredients[ingredientIndex],
                          onTap: () => viewModel
                              .removeIngredientFromList(ingredientIndex),
                        ),
                    ],
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

  @override
  void disposeForm() {
    disposeForm();
    super.disposeForm();
  }
}
