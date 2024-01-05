import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:receipe_app/ui/utilities/validation.dart';
import 'package:receipe_app/ui/views/new_dish/new_dish_view.form.dart';
import 'package:receipe_app/ui/widgets/common/app_drawer/app_drawer.dart';
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
class NewDishView extends StackedView<NewDishViewModel> with $NewDishView {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const NewDishView({super.key});

  @override
  Widget builder(
    BuildContext context,
    NewDishViewModel viewModel,
    Widget? child,
  ) {
    final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();
    final newDishScaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: newDishScaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            newDishScaffoldKey.currentState!.openDrawer();
          },
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                top: 8.h,
              ),
              child: SvgPicture.asset(
                AppImages.burgerLog,
                width: 24.7.w,
                height: 24.h,
              ),
            ),
          ),
        ),
        title: Text(
          S.current.create_a_dish,
          style: typography?.titleBold16?.copyWith(color: palette?.gray11),
        ),
      ),
      body: Builder(builder: (context) {
        Widget content = SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  S.current.create_a_dish_intro,
                  style: typography?.titleRegular16
                      ?.copyWith(color: palette?.gray8),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  controller: dishController,
                  focusNode: dishFocusNode,
                  validator: Validation.validateField,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: S.current.name_of_dish,
                    hintText: S.current.name_of_dish,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  controller: instructionController,
                  focusNode: instructionFocusNode,
                  validator: Validation.validateField,
                  keyboardType: TextInputType.text,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: S.current.instructions,
                    hintText: S.current.instructions,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  controller: ingredientController,
                  focusNode: ingredientFocusNode,
                  validator: Validation.validateField,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: S.current.ingredient_of_dish,
                    hintText: S.current.ingredient_of_dish,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () => viewModel.selectImage(),
                  child: Text(S.current.add_dish_image),
                ),
                Center(
                  child: viewModel.selectedDishImage == null
                      ? Container(
                          color: context.palette?.gray13,
                          height: 50,
                          width: 150,
                          child: Center(child: Text(S.current.image_preview)),
                        )
                      : Container(
                          color: context.palette?.gray6,
                          height: 150,
                          width: 150,
                          child: Image.file(
                            File(viewModel.selectedDishImage!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                SizedBox(height: 25),
                PrimaryButton(
                  buttonText: S.current.create_dish,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      viewModel.createDish();
                    }
                  },
                ),
              ],
            ),
          ),
        );

        List<Widget> stackChildren = [content];

        if (viewModel.isBusy) {
          stackChildren
              .add(Center(child: CircularProgressIndicator.adaptive()));
        }

        return Stack(
          children: stackChildren,
        );
      }),
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
