

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/core/factory/tp_reposity_factory.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/ui/screens/home_flow/settings/bloc/home_settings_bloc.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_bloc.dart';

class TPBlocFactory {
  static T of<T>(BuildContext context) {
    switch(T) {
      case TPAuthenticationBloc:
        TPAuthenticationRepository authenticationRepository = TPRepositoryFactory.of<TPAuthenticationRepository>(context);
        return TPAuthenticationBloc(authenticationRepository) as T;
      case HomeSettingsBloc:
        return HomeSettingsBloc(context) as T;
      case LoginBloc:
        TPUserRepository userRepository = TPRepositoryFactory.of<TPUserRepository>(context);
        TPAuthenticationRepository authenticationRepository = TPRepositoryFactory.of<TPAuthenticationRepository>(context);
        return LoginBloc(
            context: context,
            authenticationRepository: authenticationRepository,
            userRepository: userRepository) as T;
      default:
        throw Exception("TPBlocFactory can't find $T");
    }
  }
}