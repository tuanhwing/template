

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_event.dart';
import 'package:template/blocs/pages/tp_anonymous_bloc.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends TPState<TPAnonymousBloc, SplashScreen> {

  @override
  void onPostFrame() {
    context.read<TPAuthenticationBloc>().add(TPAuthenticationCheckSession());
    super.onPostFrame();
  }

  @override
  Widget get content => Center(
    child: Container(
      width: TPDimensions.DIMENSION_15*TPDimensions.DIMENSION_8,
      child: Image.asset("assets/icons/logo.png",),
    ),
  );
}