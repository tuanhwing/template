

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:template/core/tp_bloc.dart';

class TPPageBloc extends TPBloc {
  TPPageBloc({@required BuildContext context}) : super(context: context);

  StreamController<bool> loadingStreamController = StreamController<bool>.broadcast();
  Stream<bool> get loadingStream => loadingStreamController.stream;


  @override
  void dispose() {
    loadingStreamController.close();
    super.dispose();
  }
}