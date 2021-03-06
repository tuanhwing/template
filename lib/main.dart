import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/observers/tp_back_platform_observer.dart';
import 'package:template/core/observers/tp_force_logout_observer.dart';
import 'package:template/core/tp_network_requester.dart';
import 'package:template/models/notifier/tp_user_notifier.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/ui/screens/home_flow/home_wrapper.dart';
import 'package:template/ui/screens/login_flow/login_wrapper.dart';
import 'package:template/ui/screens/splash_screen.dart';
import 'package:template/utils/tp_routenames.dart';
import 'package:template/utils/tp_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(
      EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
        fallbackLocale: Locale('vi', 'VN'),
        path: 'assets/langs',
        child: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {

  final TPForceLogoutObserver _forceLogoutObserver = TPForceLogoutObserver();
  TPNetworkRequester _networkRequester;

  @override
  void initState() {
    super.initState();
    _networkRequester = TPNetworkRequester(_forceLogoutObserver);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TPForceLogoutObserver>.value(value: _forceLogoutObserver),
        Provider<TPNetworkRequester>.value(value: _networkRequester),
        Provider<TPBackPlatformObserver>(create: (_) => TPBackPlatformObserver(),),
        ChangeNotifierProvider<TPUserNotifier>(create: (_) => TPUserNotifier(TPUserModel()),)
      ],
      child: MaterialApp(
        localizationsDelegates: [
          EasyLocalization.of(context).delegate,
        ],
        theme: TPThemes.defaultTheme,
        initialRoute: TPRouteNames.SPLASH,
        routes: {
          TPRouteNames.SPLASH : (_) => SplashScreen(),
          TPRouteNames.LOGIN_FLOW : (_) => LoginWrapper(),
          TPRouteNames.HOME_FLOW : (_) => HomeWrapper()
        },
      )
    );
  }

}