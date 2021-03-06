
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/tp_colors.dart';

class TPThemes {
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: _colorScheme,
    ///Cursor color for androind+iOS
    cursorColor: TPColors.sliver,
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: TPColors.sliver,
    ),
    hintColor: TPColors.cloud,
    appBarTheme: AppBarTheme(
      color: _colorScheme.primary,
      iconTheme: IconThemeData(color: _colorScheme.onPrimary),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: _colorScheme.primary,
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    canvasColor: _colorScheme.background,
    toggleableActiveColor: _colorScheme.primary,
    highlightColor: Colors.transparent,
    indicatorColor: _colorScheme.onPrimary,
    primaryColor: _colorScheme.primary,
    accentColor: _colorScheme.primary,
    backgroundColor: TPColors.white,
    scaffoldBackgroundColor: _colorScheme.background,
  );

  static final ColorScheme _colorScheme = ColorScheme(
    primary: TPColors.black,
    primaryVariant: Color(0xFF6200EE),
    secondary: Color(0xFFFF5722),
    secondaryVariant: Color(0xFFFF5722),
    background: TPColors.white,
    surface: Color(0xFFF2F2F2),
    onBackground: TPColors.black,
    onSurface: TPColors.black,
    error: Colors.red,
    onError: TPColors.white,
    onPrimary: TPColors.white,
    onSecondary: TPColors.white,
    brightness: Brightness.light,
  );
}