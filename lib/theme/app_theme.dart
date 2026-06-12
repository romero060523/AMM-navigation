import 'package:flutter/cupertino.dart';

class AppTheme {
  // Paleta estándar iOS
  static const Color primary       = CupertinoColors.systemBlue;
  static const Color success       = CupertinoColors.systemGreen;
  static const Color danger        = CupertinoColors.systemRed;
  static const Color purple        = CupertinoColors.systemPurple;
  static const Color teal          = CupertinoColors.systemTeal;
  static const Color background    = CupertinoColors.systemGroupedBackground;
  static const Color secondaryBg   = CupertinoColors.secondarySystemGroupedBackground;
  static const Color label         = CupertinoColors.label;
  static const Color secondaryLabel = CupertinoColors.secondaryLabel;
  static const Color separator     = CupertinoColors.separator;

  static const CupertinoThemeData theme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    textTheme: CupertinoTextThemeData(
      primaryColor: primary,
    ),
  );
}