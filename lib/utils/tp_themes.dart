
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_fontsizes.dart';

class TPThemes {
  static ThemeData defaultTheme = ThemeData(
    buttonColor: TPColors.light_purple,
    fontFamily: 'Roboto',
    colorScheme: _colorScheme,
    textTheme: TextTheme(
      headline5: TextStyle(
        fontSize: TPFontSizes.SIZE_25,
        fontWeight: FontWeight.w400
      ),
      headline6: TextStyle(
        fontSize: TPFontSizes.SIZE_20,
        fontWeight: FontWeight.w700
      ),
      subtitle1: TextStyle(
        fontSize: TPFontSizes.SIZE_18,
        fontWeight: FontWeight.w400
      ),
      subtitle2: TextStyle(
        fontSize: TPFontSizes.SIZE_16,
        fontWeight: FontWeight.w500
      ),
      button: TextStyle(
        fontSize: TPFontSizes.SIZE_16,
        fontWeight: FontWeight.w700
      ),
      caption: TextStyle(
        fontSize: TPFontSizes.SIZE_13,
        fontWeight: FontWeight.w400
      ),
    ),
    ///Cursor color for androind+iOS
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: TPColors.sliver
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: TPColors.sliver,
    ),
    hintColor: TPColors.sliver,
    appBarTheme: AppBarTheme(
      color: _colorScheme.primary,
      iconTheme: IconThemeData(color: _colorScheme.onPrimary),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: _colorScheme.primary,
    ),
    buttonTheme: const ButtonThemeData(
      disabledColor: TPColors.cloud,
      buttonColor: TPColors.light_purple,
      textTheme: ButtonTextTheme.primary,
    ),
    canvasColor: _colorScheme.background,
    toggleableActiveColor: _colorScheme.primary,
    highlightColor: Colors.transparent,
    indicatorColor: _colorScheme.onPrimary,
    primaryColor: _colorScheme.primary,
    accentColor: _colorScheme.primary,
    backgroundColor: TPColors.cloud,
    scaffoldBackgroundColor: _colorScheme.background,
  );

  static final ColorScheme _colorScheme = ColorScheme(
    primary: TPColors.cloud,
    primaryVariant: TPColors.cloud.withOpacity(0.5),
    secondary: TPColors.black,
    secondaryVariant: TPColors.black.withOpacity(0.5),
    background: TPColors.cloud,
    surface: TPColors.white,
    onBackground: TPColors.blue,
    onSurface: TPColors.blue,
    error: TPColors.red,
    onError: TPColors.cloud,
    onPrimary: TPColors.cloud,
    onSecondary: TPColors.black,
    brightness: Brightness.light,
  );
}