
import 'package:flutter/cupertino.dart';
import 'package:template/blocs/tp_page_bloc.dart';
import 'package:template/core/tp_bloc.dart';

class TPLoginBloc extends TPPageBloc {
  TPLoginBloc(BuildContext context) : super(context: context);

  TextEditingController usernameTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  void login() async {

  }

  @override
  void dispose() {
    usernameTEC.dispose();
    passwordTEC.dispose();
    super.dispose();
  }
}