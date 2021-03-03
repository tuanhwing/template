

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/pages/tp_login_bloc.dart';
import 'package:template/blocs/pages/tp_splash_bloc.dart';
import 'package:template/core/tp_bloc.dart';

class TPBlocFactory {
  static T of<T extends TPBloc>(BuildContext context) {
    switch(T) {
      case TPLoginBloc:
        return TPLoginBloc(context) as T;
      case TPSplashBloc:
        return TPSplashBloc(context) as T;
      default:
        throw Exception("TPBlocFactory can't find $T");
    }
  }
}