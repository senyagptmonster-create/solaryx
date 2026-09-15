import 'package:flutter/material.dart';

class GoldenHourTokens {
  static const bg = Color(0xFFFFFBEB);
  static const surface = Color(0xFFFFFFFF);
  static const edge = Color(0xFFFDE68A);
  static const accent = Color(0xFFEA580C);
  static const accent2 = Color(0xFFFDBA74);
  static const ink = Color(0xFF431407);
  static const inkMuted = Color(0xFF9A3412);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'AppFont',
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.light(
        surface: surface,
        primary: accent,
        secondary: accent2,
        onSurface: ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surface,
        foregroundColor: ink,
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: surface,
      ),
    );
  }
}
