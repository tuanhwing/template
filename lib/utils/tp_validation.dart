
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:template/core/extensions/string_extension.dart';

class TPValidation {

  void _addError(bool result, StreamController streamController) {
    if (!result) streamController?.sink?.addError(tr('invalid').capitalize);
    else streamController.add("");
  }

  ///Value is not null and empty
  bool validate(String value, {StreamController streamController}) {
    bool result = value != null ? value.isNotEmpty : false;
    _addError(result, streamController);
    return result;
  }

  ///Validate with email param
  bool validateWithEmail(String email, {StreamController streamController}) {
    bool result = email.isValidEmail();
    _addError(result, streamController);
    return result;
  }

  ///Validate with password
  bool validateWithPasswrd(String password, {StreamController streamController}) {
    bool result = password.isValidPassword();
    _addError(result, streamController);
    return result;
  }

  ///Validate with phone
  bool validateWithPhone(String phone, {StreamController streamController}) {
    bool result = phone.isValidPhoneNumber();
    _addError(result, streamController);
    return result;
  }

  ///Validate confirmed password
  bool valiteConfirmPasswordWith(String confirmPWD, {StreamController streamController, String password}) {
    bool result = (confirmPWD.isValidPassword()) & (confirmPWD == password);
    _addError(result, streamController);
    return result;
  }
}