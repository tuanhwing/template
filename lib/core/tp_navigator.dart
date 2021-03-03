

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:template/core/tp_logger.dart';

class TPNavigator {
  static final String _string = "TPNavigator";

  ///Push a named route onto the navigator.
  ///navigatorState from the closest instance of this class that encloses the given context.
  ///
  /// If `rootNavigator` is set to true, the state from the furthest instance of
  /// this class is given instead. Useful for pushing contents above all subsequent
  /// instances of [Navigator].
  static Future pushNamed<T>(BuildContext context, String routeName, {T arguments, bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    return navigatorState.pushNamed(routeName, arguments: arguments);
  }

  static Future pushRoute(BuildContext context, PageRoute route, {bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    TPLogger.log('$_string push new route ${route.toString()}');
    return navigatorState.push(route);
  }

  static T pop<T>(BuildContext context, {T result, bool useRootNavigator: false}) {

    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    if (navigatorState.canPop()) {
      navigatorState.pop(result);
      TPLogger.log('$_string pop with result:$result');
    }
    else {
      SystemNavigator.pop();
      TPLogger.log('$_string system pop');
    }
    return result;
  }

  static Future pushReplacementNamed<T>(BuildContext context, String routeName, {T arguments, bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    TPLogger.log('$_string pushReplacementNamed $routeName');
    return navigatorState.pushReplacementNamed(routeName, arguments: arguments);

  }

  static void popUntil<T>(BuildContext context, String routeName, {bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    TPLogger.log('$_string popUntil $routeName');
    navigatorState.popUntil((route) => route.settings.name == routeName);

  }

  static void popAndPushNamed<T>(BuildContext context, String routeName, {T arguments, bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    TPLogger.log('$_string popAndPushNamed $routeName');
    navigatorState.popAndPushNamed(routeName, arguments: arguments);

  }
}