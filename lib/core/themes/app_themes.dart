import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.light: _baseTheme(Brightness.light).copyWith(),
  AppTheme.dark: _baseTheme(Brightness.dark).copyWith(),
};

ThemeData _baseTheme(Brightness brightness) {
  final theme = ThemeData(brightness: brightness);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: Colors.blue,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
    ),
  );
}

enum AppTheme {
  light,
  dark,
}
