import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:stacked/stacked.dart';
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
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        color: color ?? context.palette?.primary6,
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
                style: context.typography?.titleBold16?.copyWith(
                  color: textColor ?? context.palette?.gray1,
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
