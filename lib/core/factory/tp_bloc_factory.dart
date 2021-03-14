

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/core/factory/tp_reposity_factory.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_bloc.dart';

class TPBlocFactory {
  static T of<T>(BuildContext context) {
    switch(T) {
      case TPAuthenticationBloc:
        TPAuthenticationRepository authenticationRepository = TPRepositoryFactory.of<TPAuthenticationRepository>(context);
        TPUserRepository userRepository = TPRepositoryFactory.of<TPUserRepository>(context);
        return TPAuthenticationBloc(authenticationRepository) as T;
      case LoginBloc:
        TPUserRepository userRepository = TPRepositoryFactory.of<TPUserRepository>(context);
        TPAuthenticationRepository authenticationRepository = TPRepositoryFactory.of<TPAuthenticationRepository>(context);
        return LoginBloc(
            context: context,
            authenticationRepository: authenticationRepository,
            userRepository: userRepository) as T;

      // ///[START] LOGIN
      // case TPLoginBloc:
      //   TPUserNotifier userNotifier = Provider.of<TPUserNotifier>(context, listen: false);
      //   return TPLoginBloc(context, TPValidation(), TPRepositoryFactory.of<TPUserRepository>(context), userNotifier) as T;
      // case TPRegisterBloc:
      //   return TPRegisterBloc(context, TPValidation()) as T;
      // ///[END] LOGIN
      //
      // ///[START] HOME
      // case TPHomeBloc:
      //   return TPHomeBloc(context) as T;
      // case HomeSettingsBloc:
      //   TPUserNotifier userNotifier = Provider.of<TPUserNotifier>(context, listen: false);
      //   return HomeSettingsBloc(context, userNotifier, TPRepositoryFactory.of<TPUserRepository>(context)) as T;
      // case HomeMainBloc:
      //   return HomeMainBloc(context) as T;
      // ///[END] HOME
      // case TPSplashBloc:
      //   TPNetworkRequester requester = Provider.of<TPNetworkRequester>(context, listen: false);
      //   TPUserNotifier userNotifier = Provider.of<TPUserNotifier>(context, listen: false);
      //   return TPSplashBloc(context, requester, userNotifier) as T;
      default:
        throw Exception("TPBlocFactory can't find $T");
    }
  }
}