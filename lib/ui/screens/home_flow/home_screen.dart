

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/pages/tp_home_bloc.dart';
import 'package:template/core/tp_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends TPState<TPHomeBloc, HomeScreen> {
  @override
  // TODO: implement content
  Widget get content => Center(
    child: Text('Home Screen'),
  );

}