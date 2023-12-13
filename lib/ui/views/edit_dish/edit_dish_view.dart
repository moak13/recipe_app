import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: context.palette?.gray12,
        backgroundColor: Colors.white,
        title: Text(
          S.current.edit_dish,
          style: context.typography?.titleBold16?.copyWith(
            color: context.palette?.gray12,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.kindly_edit,
              style: context.typography?.labelRegular14?.copyWith(
                color: context.palette?.gray8,
              ),
            ),
            SizedBox(height: 25.h),
            TextFormField(
              decoration: InputDecoration(
                labelText: S.current.name_of_dish,
                hintText: S.current.name_of_dish,
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: S.current.instructions,
                hintText: S.current.instructions,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Flexible(
                  flex: 15,
                  child: TextFormField(
                    controller: ingredientsController,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: viewModel.addTextFieldInputToList,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: S.current.ingredients,
                      hintText: S.current.ingredients,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => viewModel
                        .addTextFieldInputToList(ingredientsController.text),
                    child: Icon(
                      Icons.check,
                      color: context.palette?.gray7,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            AnimatedOpacity(
              opacity: viewModel.allIngredients.isEmpty ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Text(
                S.current.click_done,
                style: context.typography?.labelRegular12,
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
                    onTap: () =>
                        viewModel.removeIngredientFromList(ingredientIndex),
                  ),
              ],
            ),
            SizedBox(height: 100.h),
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
