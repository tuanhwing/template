

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/blocs/back_platform/tp_back_platform_cubit.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/ui/screens/home_flow/main/home_main_screen.dart';
import 'package:template/ui/screens/home_flow/settings/home_settings_screen.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends TPState<LoginBloc, HomeScreen> {

  int _selectedIndex = 0;
  List<Widget> _widgets = <Widget>[
    HomeMainScreen(),
    HomeSettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    ///Handle back Android device
    context.read<TPBackPlatformCubit>().listen((_) {
      TPNavigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold
        ),
        onTap: _onItemTapped,
      ),
    );

  }

  @override
  Widget get content => _widgets.elementAt(_selectedIndex);

}