import 'package:flutter/material.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppTypography? get typography => theme.extension<AppTypography>();
  Palette? get palette => theme.extension<Palette>();
}
