
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/blocs/tp_page_bloc.dart';
import 'package:template/core/network/tp_response.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/models/notifier/tp_user_notifier.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/utils/tp_mockup.dart';
import 'package:template/utils/tp_routenames.dart';
import 'package:template/utils/tp_validation.dart';
import 'package:template/core/extensions/string_extension.dart';

class TPLoginBloc extends TPPageBloc {
  TPLoginBloc(BuildContext context, this._validater, this._userRepository, this._userNotifier) : super(context: context);

  final TPValidation _validater;
  final TPUserRepository _userRepository;
  final TPUserNotifier _userNotifier;
  TextEditingController emailTEC = TextEditingController(text: TPMockUp.USER_NAME);
  TextEditingController passwordTEC = TextEditingController(text: TPMockUp.PASSWORD);

  StreamController _emailErrorSTC = StreamController.broadcast();
  StreamController _passwordErrorSTC = StreamController.broadcast();
  Stream get emailErrorStream => _emailErrorSTC.stream;
  Stream get passwordErrorStream => _passwordErrorSTC.stream;

  ///Perform login action
  void login() async {
    String emailValue = emailTEC.text.trim();
    String passwordValue = passwordTEC.text.trim();
    bool isValid = _validater.validateWithEmail(emailValue, streamController: _emailErrorSTC) &
    _validater.validateWithPasswrd(passwordValue, streamController: _passwordErrorSTC);

    if (isValid) {
      loadingStreamController.sink.add(true);//show loading

      TPResponse response = await _userRepository.login(emailValue, passwordValue);
      if (response.code == TPResponseCode.SUCCESS) {
        await _userRepository.requester.setToken(response.data['token'], response.data['refresh_token']);
        _userNotifier.userModel = TPUserModel.fromJson(response.data);
        loadingStreamController.sink.add(false);//dismiss loading
        TPNavigator.pushReplacementNamed(context, TPRouteNames.HOME_FLOW, useRootNavigator: true);
      }
      else {
        loadingStreamController.addError(tr('error_system'));
      }

    }

  }

  ///Navigate to forget Route
  void forgetTap() {
    ///Show dialog error
    loadingStreamController.addError(tr('feature_not_available').capitalize + "!");
  }

  ///Navigate to Sign-up Route
  void signUpTap() {
    TPNavigator.pushNamed(context, TPRouteNames.REGISTER);
  }

  @override
  void dispose() {
    emailTEC.dispose();
    passwordTEC.dispose();

    _emailErrorSTC.close();
    _passwordErrorSTC.close();
    super.dispose();
  }
}