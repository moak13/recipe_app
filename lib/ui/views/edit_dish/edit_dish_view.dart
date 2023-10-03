import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
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
class EditDishView extends StackedView<EditDishViewModel> with $EditDishView {
  const EditDishView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditDishViewModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: palette?.gray12,
        backgroundColor: Colors.white,
        title: Text(
          S.current.edit_dish,
          style: typography?.titleBold16?.copyWith(
            color: palette?.gray12,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            Text(
              S.current.kindly_edit,
              style: typography?.labelRegular14?.copyWith(
                color: palette?.gray8,
              ),
            ),
            verticalSpaceMedium,
            TextFormField(
              decoration: InputDecoration(
                labelText: S.current.name_of_dish,
                hintText: S.current.name_of_dish,
              ),
            ),
            16.verticalSpace,
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: S.current.instructions,
                hintText: S.current.instructions,
              ),
            ),
            16.verticalSpace,
            TextFormField(
              controller: ingredientsController,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: viewModel.addTextFieldInputToList,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: S.current.ingredients,
                hintText: S.current.ingredients,
              ),
            ),
            verticalSpaceTiny,
            AnimatedOpacity(
              opacity: viewModel.allIngredients.isEmpty ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Text(S.current.click_done),
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
                    onTap: () =>
                        viewModel.removeIngredientFromList(ingredientIndex),
                  ),
              ],
            ),
            100.verticalSpace,
            PrimaryButton(
              buttonText: S.current.edit_dish,
              onTap: viewModel.editDish,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void disposeForm() {
    disposeForm();
    super.disposeForm();
  }

  @override
  EditDishViewModel viewModelBuilder(BuildContext context) =>
      EditDishViewModel();
}
