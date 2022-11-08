import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _orange = Color(0xFFFF4600);
  static const Color _orangeDark = Color(0xFFFF9800);
  static const Color _greyDark = Color(0xFF8696A0);
  static const Color _greyLight = Color(0xFF667781);
  static const Color _backgroundDark = Color(0xFF111b21);
  static const Color _backgroundLight = Color(0xFFFFFFFF);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundLight,
    colorScheme: ColorScheme.fromSeed(
      primary: _orange,
      onPrimary: _greyLight,
      seedColor: _orange,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundDark,
    colorScheme: ColorScheme.fromSeed(
      primary: _orangeDark,
      onPrimary: _greyDark,
      seedColor: _orangeDark,
      brightness: Brightness.dark,
    ),
  );
}
