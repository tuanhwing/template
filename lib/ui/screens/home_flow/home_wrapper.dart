

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/core/tp_wrapper.dart';
import 'package:template/ui/screens/home_flow/home_screen.dart';
import 'package:template/utils/tp_routenames.dart';

class HomeWrapper extends TPWrapper {
  @override
  Route generateRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case TPRouteNames.HOME: return MaterialPageRoute(settings: routeSettings, builder: (_) => HomeScreen());
      default: return null;
    }
  }

  @override
  String get initialRoute => TPRouteNames.HOME;

}