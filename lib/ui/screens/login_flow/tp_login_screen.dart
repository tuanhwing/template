

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/pages/tp_login_bloc.dart';
import 'package:template/core/tp_state.dart';

class TPLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();

}


class _LoginState extends TPState<TPLoginBloc, TPLoginScreen> {

  @override
  Widget get content => Center(
    child: Text("Login Screen"),
  );

}