import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.greenAccent.shade400,
);
final defaultLightTheme = ThemeData.light();
final lightTheme = defaultLightTheme.copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.inversePrimary,
    foregroundColor: lightColorScheme.inverseSurface,
  ),
  cardTheme: defaultLightTheme.cardTheme.copyWith(
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: lightColorScheme.inversePrimary,
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
);
