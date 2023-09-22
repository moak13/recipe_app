import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.headlineBold28,
    required this.headlineBold24,
    required this.titleRegular16,
    required this.titleBold16,
    required this.labelRegular12,
  });

  final TextStyle? headlineBold28;
  final TextStyle? headlineBold24;
  final TextStyle? titleRegular16;
  final TextStyle? titleBold16;
  final TextStyle? labelRegular12;

  @override
  AppTypography copyWith({
    TextStyle? headlineBold28,
    TextStyle? headlineBold24,
    TextStyle? titleRegular16,
    TextStyle? titleBold16,
    TextStyle? labelRegular12,
  }) {
    return AppTypography(
      headlineBold28: headlineBold28 ?? this.headlineBold28,
      headlineBold24: headlineBold24 ?? this.headlineBold24,
      titleRegular16: titleRegular16 ?? this.titleRegular16,
      titleBold16: titleBold16 ?? this.titleBold16,
      labelRegular12: labelRegular12 ?? this.labelRegular12,
    );
  }

  @override
  AppTypography lerp(AppTypography? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      headlineBold28: TextStyle.lerp(headlineBold28, other.headlineBold28, t),
      headlineBold24: TextStyle.lerp(headlineBold24, other.headlineBold24, t),
      titleRegular16: TextStyle.lerp(titleRegular16, other.titleRegular16, t),
      titleBold16: TextStyle.lerp(titleBold16, other.titleBold16, t),
      labelRegular12: TextStyle.lerp(labelRegular12, other.labelRegular12, t),
    );
  }
}
