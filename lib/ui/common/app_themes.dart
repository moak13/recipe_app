import 'package:flutter/material.dart';

import 'app_text_styles.dart';
import '../extension/app_typography.dart';

class AppThemes {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>[
        AppTypography(
          headlineBold24: AppTextStyles.headlineBold24,
          titleRegular16: AppTextStyles.titleRegular16,
        ),
      ],
    );
  }
}
