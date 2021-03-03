

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:template/core/tp_event.dart';

abstract class TPBloc<T> {
  BuildContext _context;
  StreamController<TPEvent<T>> streamController = StreamController<TPEvent<T>>.broadcast();
  Stream<TPEvent<T>> get stream => streamController.stream;


  TPBloc({@required BuildContext context})
      : assert(context != null),
        _context = context;

  BuildContext get context => _context;

  void dispose() {
    streamController.close();
  }
}