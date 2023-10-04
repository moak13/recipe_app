import 'package:flutter/material.dart';

@immutable
class Palette extends ThemeExtension<Palette> {
  const Palette({
    required this.gray1,
    required this.gray6,
    required this.gray7,
    required this.gray8,
    required this.gray9,
    required this.gray11,
    required this.primary6,
    required this.gray12,
    required this.gray13,
    required this.redShade,
    required this.popUpBg,
    required this.orangeShade,
    required this.barrierColor,
    required this.iconBackground2,
    required this.iconBackground3,
    required this.iconBackground,
  });

  final Color? gray8;
  final Color? gray1;
  final Color? gray6;
  final Color? gray7;
  final Color? gray9;
  final Color? gray11;
  final Color? gray12;
  final Color? primary6;
  final Color? gray13;
  final Color? redShade;
  final Color? popUpBg;
  final Color? orangeShade;
  final Color? barrierColor;
  final Color? iconBackground;
  final Color? iconBackground2;
  final Color? iconBackground3;

  @override
  Palette copyWith({
    Color? gray1,
    Color? gray6,
    Color? gray7,
    Color? gray8,
    Color? gray9,
    Color? gray11,
    Color? primary6,
    Color? gray12,
    Color? gray13,
    Color? redShade,
    Color? popUpBg,
    Color? barrierColor,
    Color? iconBackground2,
    Color? iconBackground3,
    Color? orangeShade,
    Color? iconBackground,
  }) {
    return Palette(
      gray1: gray1 ?? this.gray1,
      gray6: gray6 ?? this.gray6,
      gray7: gray7 ?? this.gray7,
      gray8: gray8 ?? this.gray8,
      gray11: gray11 ?? this.gray11,
      gray9: gray9 ?? this.gray9,
      primary6: primary6 ?? this.primary6,
      gray12: gray12 ?? this.gray12,
      gray13: gray13 ?? this.gray13,
      redShade: redShade ?? this.redShade,
      popUpBg: popUpBg ?? this.popUpBg,
      barrierColor: barrierColor ?? this.barrierColor,
      iconBackground2: iconBackground2 ?? this.iconBackground2,
      iconBackground3: iconBackground3 ?? this.iconBackground3,
      orangeShade: orangeShade ?? this.orangeShade,
      iconBackground: iconBackground ?? this.iconBackground,
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
      gray8: Color.lerp(gray8, other.gray8, t),
      gray9: Color.lerp(gray9, other.gray9, t),
      gray11: Color.lerp(gray11, other.gray11, t),
      gray12: Color.lerp(gray12, other.gray12, t),
      primary6: Color.lerp(primary6, other.primary6, t),
      gray13: Color.lerp(gray13, other.gray13, t),
      redShade: Color.lerp(redShade, other.redShade, t),
      popUpBg: Color.lerp(popUpBg, other.popUpBg, t),
      orangeShade: Color.lerp(orangeShade, other.orangeShade, t),
      barrierColor: Color.lerp(barrierColor, other.barrierColor, t),
      iconBackground2: Color.lerp(iconBackground2, other.iconBackground2, t),
      iconBackground3: Color.lerp(iconBackground3, other.iconBackground3, t),
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t),
    );
  }
}
