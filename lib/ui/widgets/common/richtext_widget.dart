import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    required this.color1,
    required this.color2,
    required this.text1,
    required this.text2,
    this.fontWeight1,
    this.fontWeight2,
    this.fontSize1,
    this.fontSize2,
  });

  final Color? color1;
  final Color? color2;
  final String? text1;
  final String? text2;
  final FontWeight? fontWeight1;
  final FontWeight? fontWeight2;
  final double? fontSize1;
  final double? fontSize2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: context.typography?.labelRegular12?.copyWith(
          color: color1,
          fontWeight: fontWeight1,
          fontSize: fontSize1 ?? 12.sp,
        ),
        children: [
          TextSpan(
            text: text2,
            style: context.typography?.labelRegular12?.copyWith(
              color: color2,
              fontWeight: fontWeight2,
              fontSize: fontSize2 ?? 12.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }
}
