import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

class IngredientChip extends StatelessWidget {
  const IngredientChip({
    super.key,
    required this.content,
    required this.onTap,
  });
  final String content;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    late ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: kcOrangeShade,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: typography?.labelRegular12,
          ),
          10.horizontalSpace,
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.cancel,
              color: palette?.gray13,
            ),
          ),
        ],
      ),
    );
  }
}
