

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/core/tp_wrapper.dart';
import 'package:template/ui/screens/login_flow/login/login_screen.dart';
import 'package:template/ui/screens/login_flow/register/register_screen.dart';
import 'package:template/utils/tp_routenames.dart';

class LoginWrapper extends TPWrapper {

  @override
  Route generateRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case TPRouteNames.LOGIN: return MaterialPageRoute(settings: routeSettings, builder: (_) => LoginScreen());
      case TPRouteNames.REGISTER: return MaterialPageRoute(settings: routeSettings, builder: (_) => RegisterScreen());
      default: return null;
    }
  }

  @override
  String get initialRoute => TPRouteNames.LOGIN;

}