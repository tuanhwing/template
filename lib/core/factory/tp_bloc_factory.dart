

import 'package:flutter/cupertino.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/blocs/pages/login_flow/register/register_bloc.dart';
import 'package:template/blocs/pages/tp_anonymous_bloc.dart';
import 'package:template/core/factory/tp_reposity_factory.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/blocs/pages/home_flow/settings/home_settings_bloc.dart';
import 'package:template/blocs/pages/login_flow/login/login_bloc.dart';

class TPBlocFactory {
  static T of<T>({BuildContext context}) {
    switch(T) {
      case TPAnonymousBloc:
        return TPAnonymousBloc(context) as T;

      case TPAuthenticationBloc:
        TPAuthenticationRepository authenticationRepository = TPRepositoryFactory.of<TPAuthenticationRepository>();
        return TPAuthenticationBloc(authenticationRepository) as T;

      //[START] HOME FLOW
      case HomeSettingsBloc:
        return HomeSettingsBloc(context) as T;
      //[END] HOME FLOW

      //[START] LOGIN FLOW
      case LoginBloc:
        TPUserRepository userRepository = TPRepositoryFactory.of<TPUserRepository>();
        TPAuthenticationRepository authenticationRepository = TPRepositoryFactory.of<TPAuthenticationRepository>();
        return LoginBloc(
            context: context,
            authenticationRepository: authenticationRepository,
            userRepository: userRepository) as T;

      case RegisterBloc:
        return RegisterBloc(context) as T;
      //[START] LOGIN FLOW
      default:
        throw Exception("TPBlocFactory can't find $T");
    }
  }
}