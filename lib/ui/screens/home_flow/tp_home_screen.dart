

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/pages/tp_home_bloc.dart';
import 'package:template/core/tp_state.dart';

class TPHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TPHomeState();

}

class _TPHomeState extends TPState<TPHomeBloc, TPHomeScreen> {
  @override
  // TODO: implement content
  Widget get content => Center(
    child: Text('Home Screen'),
  );

}