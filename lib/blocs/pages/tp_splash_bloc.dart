

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/tp_page_bloc.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/core/tp_network_requester.dart';
import 'package:template/models/notifier/tp_user_notifier.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/utils/tp_defines.dart';
import 'package:template/utils/tp_routenames.dart';
import 'package:template/utils/tp_utils.dart';
import 'package:template/core/extensions/string_extension.dart';

class TPSplashBloc extends TPPageBloc {
  TPSplashBloc(BuildContext context, this._requester, this._userNotifier) : super(context: context);

  final TPNetworkRequester _requester;
  final TPUserNotifier _userNotifier;
  
  void initialize() async {

    await Future.delayed(Duration(seconds: 1));
    String data = await TPUtils.loadData(TPDefines.USER_INFO_KEY);
    String token = await TPUtils.loadData(TPDefines.TOKEN_KEY);
    String refreshToken = await TPUtils.loadData(TPDefines.REFRESH_TOKEN_KEY);
    
    if (data != null && !StringExtension.isNullOrEmpty(token) && !StringExtension.isNullOrEmpty(refreshToken)) {
      _requester.setToken(token, refreshToken);
      _userNotifier.userModel = TPUserModel.fromJson(json.decode(data));
      _userNotifier.isLogined = true;

      TPNavigator.pushReplacementNamed(context, TPRouteNames.HOME_FLOW);
      return;
    }

    TPNavigator.pushReplacementNamed(context, TPRouteNames.LOGIN_FLOW);
  }
}