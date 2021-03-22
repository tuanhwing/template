

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/utils/tp_defines.dart';
import 'package:template/utils/tp_dimensions.dart';

class TPUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> saveData(String key, String value) async {
    final prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future<void> deleteData(String key) async {
    final prefs = await _prefs;
    prefs.remove(key);

  }

  static Future<String> loadData(String key) async {
    final prefs = await _prefs;
    return prefs.get(key);
  }

  static Locale getNextLocale(BuildContext context) {
    int index;
    for (index = 0; index < TPDefines.locales.length; index++) {
      if (TPDefines.locales[index].languageCode == context.locale.languageCode) break;
    }
    index = index + 1 >= TPDefines.locales.length ? 0 : (index + 1);
    return TPDefines.locales[index];
  }


  ///[START] Dialog
////Show Notify Alert
  static void showNotifyDialog(BuildContext context, {String message, Function yes, bool useRootNavigator = false}) {
    List<Widget> actions = [];
    actions.add(CupertinoDialogAction(
        child: Text(
          tr('ok').allInCaps
        ),
        onPressed: () {
          if (yes != null) yes();
          TPNavigator.pop(context, useRootNavigator: useRootNavigator);
        }
    ));

    showDialog(
        useRootNavigator: useRootNavigator,
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            tr('notify').allInCaps
          ),
          content: Container(
            padding: EdgeInsets.only(top: TPDimensions.DIMENSION_8),
            child: Text(message),
          ),
          actions: actions,
        )
    );
  }

  //Show Confirm Alert with YES/NO
  static void showConfirmDialog(BuildContext context, {String message, Function yes, Function no, bool useRootNavigator = false}) {
    List<Widget> actions = [];
    actions.add(CupertinoDialogAction(
        child: Text(
          tr('no').allInCaps
        ),
        onPressed: () {
          if (no != null) no();
          TPNavigator.pop(context, useRootNavigator: useRootNavigator);
        }
    ));
    actions.add(CupertinoDialogAction(
        child: Text(
          tr('yes').allInCaps
        ),
        onPressed: () {
          if (yes != null) yes();
          TPNavigator.pop(context, useRootNavigator: useRootNavigator);
        }
    ));

    showDialog(
        useRootNavigator: useRootNavigator,
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Text(tr('notify').allInCaps),
          content: Container(
            padding: EdgeInsets.only(top: TPDimensions.DIMENSION_8),
            child: Text(message),
          ),
          actions: actions,
        )
    );
  }
  ///[END] Dialog
}