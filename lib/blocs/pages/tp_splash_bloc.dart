

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/tp_page_bloc.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/utils/tp_routenames.dart';

class TPSplashBloc extends TPPageBloc {
  TPSplashBloc(BuildContext context) : super(context: context);

  void initialize() async {
    // loadingStreamController.sink.add(true);//Show loading
    // await Future.delayed(Duration(seconds: 1));
    // loadingStreamController.sink.add(false);//Show loading
    // await Future.delayed(Duration(seconds: 1));
    // loadingStreamController.addError("LOLLLLLLLLL");//Show loading

    await Future.delayed(Duration(seconds: 1));
    TPNavigator.pushReplacementNamed(context, TPRouteNames.LOGIN_FLOW);
  }
}