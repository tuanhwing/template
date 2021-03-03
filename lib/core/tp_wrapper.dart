

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/core/observers/tp_back_platform_observer.dart';

abstract class TPWrapper extends StatelessWidget {

  String get initialRoute;
  Route generateRoutes(RouteSettings routeSettings);

  Future<bool> _onWillPop(BuildContext context) async {
    Provider.of<TPBackPlatformObserver>(context, listen: false).addEvent(true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Navigator(
        initialRoute: initialRoute,
        onGenerateRoute: generateRoutes,
      )
    );

  }
}