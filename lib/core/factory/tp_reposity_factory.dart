

import 'package:flutter/cupertino.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
import 'package:template/repositories/tp_user_repository.dart';

class TPRepositoryFactory {

  static T of<T>(BuildContext context) {
    switch(T) {
      case TPAuthenticationRepository: return TPAuthenticationRepository() as T;
      case TPUserRepository: return TPUserRepository() as T;
      default: throw Exception("TPBlocFactory can't find $T");
    }
  }
}