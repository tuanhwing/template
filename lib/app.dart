
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/tp_logger.dart';
import 'package:provider/provider.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_state.dart';
import 'package:template/core/factory/tp_bloc_factory.dart';
import 'package:template/core/tp_network_requester.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
import 'package:template/ui/screens/home_flow/home_wrapper.dart';
import 'package:template/ui/screens/login_flow/login_wrapper.dart';
import 'package:template/ui/screens/splash_screen.dart';
import 'package:template/utils/tp_route_names.dart';
import 'package:template/utils/tp_themes.dart';
import 'package:template/utils/tp_utils.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TPBlocFactory.of<TPAuthenticationBloc>(),),
      ],
      child: AppView(),
    );
  }
}


class AppView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();

}

class _AppState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    super.initState();
    TPNetworkRequester().authenticationBloc = context.read<TPAuthenticationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    TPLogger.log("_AppState rebuild ${context.locale.languageCode}");
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: TPThemes.defaultTheme,
      builder: (context, child) {
        return BlocListener<TPAuthenticationBloc, TPAuthenticationState>(
          listener: (context, state) {
            switch(state.status) {
              case TPAuthenticationStatus.authenticated:
                _navigator.pushReplacementNamed(TPRouteNames.HOME_FLOW);
                break;
              case TPAuthenticationStatus.session_expired:
                TPUtils.showNotifyDialog(
                    context,
                    message: tr("session_expired"),
                    useRootNavigator: true,
                    yes: () {
                      _navigator.pushReplacementNamed(TPRouteNames.LOGIN_FLOW);
                    });
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
    );
  }

}