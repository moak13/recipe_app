import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    required this.color1,
    required this.color2,
    required this.text1,
   required this.text2,
  });

  final Color? color1;
  final Color? color2;
  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    return Text.rich(
      TextSpan(
          text: text1,
          style: typography?.labelRegular12?.copyWith(
            color: color1,
            fontSize: 12.sp,
            height: 1.57,
          ),
          children: [
            TextSpan(
              text: text2,
              style: typography?.labelRegular12?.copyWith(
                color: color2,
                fontSize: 12.sp,
                height: 1.57,
              ),
            ),
          ]),
    );
  }
}
