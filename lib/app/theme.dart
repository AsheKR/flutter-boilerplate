import 'package:flutter/material.dart';

class AppTheme {
  static const String fontFamily = 'SUIT';

  static ThemeData get _base {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
    );
  }

  static ThemeData get light {
    return _base;
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}
