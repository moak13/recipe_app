import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.headlineBold24,
    required this.titleRegular16,
  });

  final TextStyle? headlineBold24;
  final TextStyle? titleRegular16;

  @override
  AppTypography copyWith({
    TextStyle? headlineBold24,
    TextStyle? titleRegular16,
  }) {
    return AppTypography(
      headlineBold24: headlineBold24 ?? this.headlineBold24,
      titleRegular16: titleRegular16 ?? this.titleRegular16,
    );
  }

  @override
  AppTypography lerp(AppTypography? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      headlineBold24: TextStyle.lerp(headlineBold24, other.headlineBold24, t),
      titleRegular16: TextStyle.lerp(titleRegular16, other.titleRegular16, t),
    );
  }
}
