import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_event.dart';
import 'package:template/blocs/authentication/tp_authentication_state.dart';
import 'package:template/core/observers/tp_back_platform_observer.dart';
import 'package:template/core/observers/tp_authentication_observer.dart';
import 'package:template/core/tp_network_requester.dart';
import 'package:template/models/notifier/tp_user_notifier.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
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
        child: MyApp(TPAuthenticationRepository())
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp(this._authenticationRepository);
  final TPAuthenticationRepository _authenticationRepository;

  @override
  State<StatefulWidget> createState() => _MyAppState(TPNetworkRequester(_authenticationRepository));

}


class _MyAppState extends State<MyApp> {
  _MyAppState(this._networkRequester);
  final TPNetworkRequester _networkRequester;
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<TPNetworkRequester>.value(value: _networkRequester),
        Provider<TPBackPlatformObserver>(create: (_) => TPBackPlatformObserver(),),
        ChangeNotifierProvider<TPUserNotifier>(create: (_) => TPUserNotifier(TPUserModel()),)
      ],
      child: BlocProvider<TPAuthenticationBloc>(
        create: (_) => TPAuthenticationBloc(widget._authenticationRepository),
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          localizationsDelegates: [
            EasyLocalization.of(context).delegate,
          ],
          theme: TPThemes.defaultTheme,
          builder: (context, child) {
            return BlocListener<TPAuthenticationBloc, TPAuthenticationState>(
              listener: (context, state) {
                switch(state.status) {
                  case TPAuthenticationStatus.authenticated:
                    _navigator.pushReplacementNamed(TPRouteNames.HOME_FLOW);
                    break;
                  case TPAuthenticationStatus.session_expired:
                    _navigator.pushReplacementNamed(TPRouteNames.LOGIN_FLOW);
                    break;
                  default:
                    _navigator.pushReplacementNamed(TPRouteNames.LOGIN_FLOW);
                    break;
                }
              },
              child: child,
            );
          },
          initialRoute: TPRouteNames.SPLASH,
          routes: {
            TPRouteNames.SPLASH : (_) => SplashScreen(),
            TPRouteNames.LOGIN_FLOW : (_) => LoginWrapper(),
            TPRouteNames.HOME_FLOW : (_) => HomeWrapper()
          },
        ),
      )
    );
  }
}