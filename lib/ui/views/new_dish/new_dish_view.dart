import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/utilities/validation.dart';
import 'package:receipe_app/ui/views/new_dish/new_dish_view.form.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:stacked/stacked_annotations.dart';
import 'new_dish_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'dish'),
  FormTextField(name: 'instruction'),
  FormTextField(name: 'ingredient')
])
class NewDishView extends StackedView<NewDishViewModel>with $NewDishView {
  const NewDishView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget builder(
    BuildContext context,
    NewDishViewModel viewModel,
    Widget? child,
  ) {
    final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();

    return Scaffold(
      appBar: AppBar(
      leading:Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          'assets/svg/hamburger_icon.svg',
          ),
      ),
      title:Text(S.current.create_a_dish,
                style: typography?.titleBold16?.copyWith(color: palette?.gray11)) ,     
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: sidePadding
          ),
        child: Form(
          child: Column(
          children: [
            Text(S.current.create_a_dish_intro,
             style: typography?.titleRegular16?.copyWith(color: palette?.gray8)),
             SizedBox(height: 20.h,),
             TextFormField(
                controller: dishController,
                focusNode: dishFocusNode,
                validator: Validation.validateField,
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                  labelText:  S.current.name_of_dish,
                  hintText: S.current.name_of_dish, 
                ),
              ),
              SizedBox(height: 15.h,),
              TextFormField(
                 controller: instructionController,
                focusNode: instructionFocusNode,
                validator: Validation.validateField,
                keyboardType: TextInputType.text,
                maxLines: 8,
                decoration:  InputDecoration(
                  labelText: S.current.instructions,
                  hintText: S.current.instructions,
                ),
              ),
              SizedBox(height: 15.h,),
              TextFormField(
                controller: ingredientController,
                focusNode: ingredientFocusNode,
                validator: Validation.validateField,
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                  labelText: S.current.ingredient_of_dish,
                  hintText: S.current.ingredient_of_dish,
                ),
              ),
               SizedBox(
                height: 253.h,
              ),
               PrimaryButton(
                buttonText: S.current.create_dish,
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    viewModel.createDish();
                  }

                },
              )
          ],   
          ),
        ),
        ),
      ),
    );
  }

   @override
  void onViewModelReady(NewDishViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(NewDishViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }


  @override
  NewDishViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NewDishViewModel();
}
