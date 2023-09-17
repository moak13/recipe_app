import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
import 'package:stacked/stacked.dart';

import 'custom_input_field_model.dart';

class CustomInputField extends StackedView<CustomInputFieldModel> {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hint;
  final String? label;
  const CustomInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.obscureText = false,
    this.suffixIcon,
    this.hint,
    this.label,
  });

  @override
  Widget builder(
    BuildContext context,
    CustomInputFieldModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    Palette? palette = theme.extension<Palette>();
    AppTypography? typography = theme.extension<AppTypography>();
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      cursorColor: palette?.primary6,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        hintStyle: typography?.titleRegular16?.copyWith(
          color: palette?.gray9,
        ),
        labelStyle: typography?.labelRegular12?.copyWith(
          color: palette?.gray9,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(
            color: AppColors.gray6,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(
            color: AppColors.primary6,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(
            color: AppColors.primary6,
          ),
        ),
      ),
    );
  }

  @override
  CustomInputFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomInputFieldModel();
}
