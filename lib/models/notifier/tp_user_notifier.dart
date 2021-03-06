

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/utils/tp_defines.dart';
import 'package:template/utils/tp_utils.dart';

class TPUserNotifier extends ChangeNotifier {
  TPUserModel _model;
  bool isLogined = false;

  TPUserNotifier(this._model);

  TPUserModel get userModel => _model;
  set userModel(TPUserModel user) {
    _model.clone(user);
    String data = json.encode(_model.toJson());
    TPUtils.saveData(TPDefines.USER_INFO_KEY, data);
    notifyListeners();
  }
}