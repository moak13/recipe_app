import 'package:flutter/material.dart';

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
      extensions: <ThemeExtension<dynamic>>[
        AppTypography(
          headlineBold24: AppTextStyles.headlineBold24,
          titleRegular16: AppTextStyles.titleRegular16,
          titleBold16: AppTextStyles.titleBold16,
        ),
        const Palette(
          gray1: AppColors.gray1,
          gray7: AppColors.gray7,
          gray11: AppColors.gray11,
          primary6: AppColors.primary6,
        ),
      ],
    );
  }
}
