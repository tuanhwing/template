

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/blocs/back_platform/tp_back_platform_cubit.dart';

abstract class TPWrapper extends StatelessWidget {

  String get initialRoute;
  Route generateRoutes(RouteSettings routeSettings);

  Future<bool> _onWillPop(BuildContext context) async {
    context.read<TPBackPlatformCubit>().notify();
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