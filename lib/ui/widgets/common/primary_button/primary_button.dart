import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../extension/app_typography.dart';
import '../../../extension/palette.dart';
import 'primary_button_model.dart';

class PrimaryButton extends StackedView<PrimaryButtonModel> {
  final String buttonText;
  final VoidCallback? onTap;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;

  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.textColor,
    this.onTap,
    this.color,
    this.borderRadius,
  });

  @override
  Widget builder(
    BuildContext context,
    PrimaryButtonModel viewModel,
    Widget? child,
  ) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        color: color ?? palette?.primary6,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
          onTap: onTap,
          child: SizedBox(
            height: 56.h,
            width: double.infinity,
            child: Center(
              child: Text(
                buttonText,
                style: typography?.titleBold16?.copyWith(
                  color: textColor ?? palette?.gray1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  PrimaryButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrimaryButtonModel();
}
