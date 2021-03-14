

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/utils/tp_validation.dart';
import 'package:template/core/extensions/string_extension.dart';

// class TPRegisterBloc extends TPPageBloc {
//   TPRegisterBloc(BuildContext context, this._validater) : super(context: context);
//
//   final TPValidation _validater;
//
//   //TEC
//   final TextEditingController nameTEC = TextEditingController();
//   final TextEditingController emailTEC = TextEditingController();
//   final TextEditingController phoneTEC = TextEditingController();
//   final TextEditingController passwordTEC = TextEditingController();
//   final TextEditingController confirmPasswordTEC = TextEditingController();
//
//   //STC
//   StreamController _nameSTC = StreamController.broadcast();
//   StreamController _emailSTC = StreamController.broadcast();
//   StreamController _phoneSTC = StreamController.broadcast();
//   StreamController _passwordSTC = StreamController.broadcast();
//   StreamController _passwordConfirmSTC = StreamController.broadcast();
//
//   //Stream
//   Stream get nameErrorStream => _nameSTC.stream;
//   Stream get emailErrorStream => _emailSTC.stream;
//   Stream get phoneErrorStream => _phoneSTC.stream;
//   Stream get passwordErrorStream => _passwordSTC.stream;
//   Stream get passwordConfirmErrorStream => _passwordConfirmSTC.stream;
//
//   ///Perform register action
//   void register() async {
//     String nameValue = nameTEC.text.trim();
//     String emailValue = emailTEC.text.trim();
//     String phoneValue = phoneTEC.text.trim();
//     String pwdValue = passwordTEC.text.trim();
//     String pwdConfirmvalue = confirmPasswordTEC.text.trim();
//
//     bool isValid = _validater.validate(nameValue, streamController: _nameSTC)
//       & _validater.validateWithEmail(emailValue, streamController: _emailSTC)
//       & _validater.validateWithPhone(phoneValue, streamController: _phoneSTC)
//       & _validater.validateWithPasswrd(pwdValue, streamController: _passwordSTC)
//       & _validater.valiteConfirmPasswordWith(pwdConfirmvalue, password: pwdValue, streamController: _passwordConfirmSTC);
//
//     if (isValid) {
//       loadingStreamController.sink.add(true);
//       await Future.delayed(Duration(seconds: 1));
//       loadingStreamController.sink.addError(tr('feature_not_available').capitalize + "!");
//     }
//   }
//
//   @override
//   void dispose() {
//     nameTEC.dispose();
//     emailTEC.dispose();
//     phoneTEC.dispose();
//     passwordTEC.dispose();
//     confirmPasswordTEC.dispose();
//
//     _nameSTC.close();
//     _emailSTC.close();
//     _phoneSTC.close();
//     _passwordSTC.close();
//     _passwordConfirmSTC.close();
//     super.dispose();
//   }
// }
