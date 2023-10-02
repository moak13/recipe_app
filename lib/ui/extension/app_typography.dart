import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.headlineBold28,
    required this.headlineBold24,
    required this.headlineBold22,
    required this.titleRegular16,
    required this.titleBold16,
    required this.labelRegular12,
    required this.labelMedium16,
    required this.labelRegular14,
    required this.labelRegular16,
  });

  final TextStyle? headlineBold28;
  final TextStyle? headlineBold24;
  final TextStyle? headlineBold22;
  final TextStyle? titleRegular16;
  final TextStyle? titleBold16;
  final TextStyle? labelRegular12;
  final TextStyle? labelMedium16;
  final TextStyle? labelRegular14;
  final TextStyle? labelRegular16;

  @override
  AppTypography copyWith({
    TextStyle? headlineBold28,
    TextStyle? headlineBold24,
    TextStyle? titleRegular16,
    TextStyle? titleBold16,
    TextStyle? labelRegular12,
    TextStyle? labelRegular14,
    TextStyle? labelRegular16,
    TextStyle? labelMedium16,
  }) {
    return AppTypography(
      headlineBold28: headlineBold28 ?? this.headlineBold28,
      headlineBold24: headlineBold24 ?? this.headlineBold24,
      headlineBold22: headlineBold22 ?? this.headlineBold22,
      titleRegular16: titleRegular16 ?? this.titleRegular16,
      titleBold16: titleBold16 ?? this.titleBold16,
      labelRegular12: labelRegular12 ?? this.labelRegular12,
      labelRegular14: labelRegular14 ?? this.labelRegular14,
      labelMedium16: labelMedium16 ?? this.labelMedium16,
      labelRegular16: labelRegular16 ?? this.labelRegular16,
    );
  }

  @override
  AppTypography lerp(AppTypography? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      labelRegular14: TextStyle.lerp(labelRegular14, other.labelRegular14, t),
      headlineBold28: TextStyle.lerp(headlineBold28, other.headlineBold28, t),
      headlineBold24: TextStyle.lerp(headlineBold24, other.headlineBold24, t),
      headlineBold22: TextStyle.lerp(headlineBold22, other.headlineBold22, t),
      titleRegular16: TextStyle.lerp(titleRegular16, other.titleRegular16, t),
      titleBold16: TextStyle.lerp(titleBold16, other.titleBold16, t),
      labelRegular12: TextStyle.lerp(labelRegular12, other.labelRegular12, t),
      labelMedium16: TextStyle.lerp(labelMedium16, other.labelMedium16, t),
      labelRegular16: TextStyle.lerp(labelRegular16, other.labelRegular12, t),
    );
  }
}
