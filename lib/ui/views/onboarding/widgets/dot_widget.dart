import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  final int index;
  final int length;
  const DotWidget({super.key, required this.index, required this.length});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DotsIndicator(
      dotsCount: length,
      position: index,
      decorator: DotsDecorator(
        color: theme.primaryColor.withOpacity(0.1),
        activeColor: theme.primaryColor,
        size: Size(20.w, 3.h),
        activeSize: Size(20.w, 3.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
