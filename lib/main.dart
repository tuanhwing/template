import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/app.dart';
import 'package:template/repositories/tp_authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(
      EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
        fallbackLocale: Locale('vi', 'VN'),
        path: 'assets/langs',
        child: App(TPAuthenticationRepository())
      )
  );
}