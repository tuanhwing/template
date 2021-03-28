import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/app.dart';
import 'package:template/utils/tp_defines.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: TPDefines.locales,
        fallbackLocale: TPDefines.locales.first,
        path: 'assets/langs',
        child: App()
      )
  );
}