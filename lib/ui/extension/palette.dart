import 'package:flutter/material.dart';

@immutable
class Palette extends ThemeExtension<Palette> {
  const Palette({
    required this.gray1,
    required this.gray6,
    required this.gray7,
    required this.gray9,
    required this.gray11,
    required this.primary6,
  });

  final Color? gray1;
  final Color? gray6;
  final Color? gray7;
  final Color? gray9;
  final Color? gray11;
  final Color? primary6;

  @override
  Palette copyWith({
    Color? gray1,
    Color? gray6,
    Color? gray7,
    Color? gray9,
    Color? gray11,
    Color? primary6,
  }) {
    return Palette(
      gray1: gray1 ?? this.gray1,
      gray6: gray6 ?? this.gray6,
      gray7: gray7 ?? this.gray7,
      gray11: gray11 ?? this.gray11,
      gray9: gray9 ?? this.gray9,
      primary6: primary6 ?? this.primary6,
    );
  }

  @override
  Palette lerp(Palette? other, double t) {
    if (other is! Palette) {
      return this;
    }
    return Palette(
      gray1: Color.lerp(gray1, other.gray1, t),
      gray6: Color.lerp(gray6, other.gray6, t),
      gray7: Color.lerp(gray7, other.gray7, t),
      gray9: Color.lerp(gray9, other.gray9, t),
      gray11: Color.lerp(gray11, other.gray11, t),
      primary6: Color.lerp(primary6, other.primary6, t),
    );
  }
}
