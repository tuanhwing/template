

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/blocs/pages/login/tp_login_bloc.dart';
import 'package:template/blocs/pages/login/tp_register_bloc.dart';
import 'package:template/blocs/pages/tp_home_bloc.dart';
import 'package:template/blocs/pages/tp_splash_bloc.dart';
import 'package:template/core/factory/tp_reposity_factory.dart';
import 'package:template/core/tp_bloc.dart';
import 'package:template/models/notifier/tp_user_notifier.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/utils/tp_validation.dart';

class TPBlocFactory {
  static T of<T extends TPBloc>(BuildContext context) {
    switch(T) {
      ///[START] LOGIN
      case TPLoginBloc:
        TPUserNotifier userNotifier = Provider.of<TPUserNotifier>(context, listen: false);
        return TPLoginBloc(context, TPValidation(), TPRepositoryFactory.of<TPUserRepository>(context), userNotifier) as T;
      case TPRegisterBloc:
        return TPRegisterBloc(context, TPValidation()) as T;
      ///[END] LOGIN

      ///[START] HOME
      case TPHomeBloc:
        return TPHomeBloc(context) as T;
      ///[END] HOME
      case TPSplashBloc:
        return TPSplashBloc(context) as T;
      default:
        throw Exception("TPBlocFactory can't find $T");
    }
  }
}