import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extension/app_typography.dart';
import '../extension/palette.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary6,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.primary6),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyles.titleRegular16.copyWith(
          color: AppColors.gray9,
        ),
        labelStyle: AppTextStyles.labelRegular12.copyWith(
          color: AppColors.gray9,
        ),
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
      extensions: <ThemeExtension<dynamic>>[
        AppTypography(
          headlineBold28: AppTextStyles.headlineBold28,
          headlineBold24: AppTextStyles.headlineBold24,
          titleRegular16: AppTextStyles.titleRegular16,
          titleBold16: AppTextStyles.titleBold16,
          labelRegular12: AppTextStyles.labelRegular12,
          labelMedium16: AppTextStyles.labelMedium16
        ),
        const Palette(
          gray1: AppColors.gray1,
          gray6: AppColors.gray6,
          gray7: AppColors.gray7,
          gray8: AppColors.gray8,
          gray9: AppColors.gray9,
          gray11: AppColors.gray11,
          primary6: AppColors.primary6,
          gray12:AppColors.gray12
        ),
      ],
    );
  }
}
