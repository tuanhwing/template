

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_bloc.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_routenames.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends TPState<LoginBloc, SplashScreen> {
  @override
  // TODO: implement bloc
  LoginBloc get bloc => null;


  @override
  void onPostFrame() {
    TPNavigator.pushReplacementNamed(context, TPRouteNames.LOGIN_FLOW);
    super.onPostFrame();
  }

  @override
  Widget get content => Center(
    child: Container(
      width: TPDimensions.DIMENSION_15*TPDimensions.DIMENSION_8,
      child: Image.asset(
        "assets/icons/logo.png",
      ),
    ),
  );

}