

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/blocs/pages/tp_splash_bloc.dart';
import 'package:template/core/tp_state.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends TPState<TPSplashBloc, SplashScreen> {

  @override
  void onPostFrame() {
    super.onPostFrame();
    bloc.initialize();
  }

  @override
  Widget get content => Center(
    child: Text("Splash Screen"),
  );

}