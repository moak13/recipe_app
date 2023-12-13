import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';

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
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: context.palette?.orangeShade,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: context.typography?.labelRegular12,
          ),
          10.horizontalSpace,
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.cancel,
              color: context.palette?.gray13,
            ),
          ),
        ],
      ),
    );
  }
}
