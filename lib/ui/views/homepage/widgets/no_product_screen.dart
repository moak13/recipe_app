import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        Text(
          'No Available Dish',
          textAlign: TextAlign.center,
          style: typography?.headlineBold24?.copyWith(
            color: palette?.gray11,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: Text(
            'There are no available dish to view currently',
            textAlign: TextAlign.center,
            style: typography?.titleRegular16?.copyWith(
              color: palette?.gray7,
            ),
          ),
        ),
      ],
    );
  }
}
