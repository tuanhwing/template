

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/models/notifier/tp_user_notifier.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/utils/tp_defines.dart';
import 'package:template/utils/tp_routenames.dart';
import 'package:template/utils/tp_utils.dart';
import 'package:template/core/extensions/string_extension.dart';

// class HomeSettingsBloc extends TPPageBloc {
//   HomeSettingsBloc(BuildContext context, this._userNotifier, this._userRepository) : super(context: context);
//
//   final TPUserNotifier _userNotifier;
//   final TPUserRepository _userRepository;
//
//   TPUserModel get userModel => _userNotifier.userModel;
//
//   ///PRIVATE METHODS
//   void _doLogout() async {
//     loadingStreamController.sink.add(true);//show loading
//     await _userRepository.logout();
//     await _userRepository.requester.removeToken();
//     _userNotifier.userModel = TPUserModel();
//     _userNotifier.isLogined = false;
//
//     TPUtils.deleteData(TPDefines.USER_INFO_KEY);
//     loadingStreamController.sink.add(false);//dismiss loading
//     TPNavigator.pushReplacementNamed(context, TPRouteNames.LOGIN_FLOW, useRootNavigator: true);
//   }
//
//   void logout() {
//     TPUtils.showConfirmDialog(
//       context,
//       message: tr('do_you_really_want_to_logout').capitalize + "?",
//       useRootNavigator: true,
//       yes: _doLogout
//     );
//
//   }
// }