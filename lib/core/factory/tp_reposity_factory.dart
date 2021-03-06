

import 'package:flutter/cupertino.dart';
import 'package:template/repositories/tp_repository.dart';
import 'package:template/repositories/tp_user_repository.dart';

class TPRepositoryFactory {


  static T of<T extends TPRepository>(BuildContext context) {
    switch(T) {
      case TPUserRepository: return TPUserRepository(context) as T;
      default: Exception("TPBlocFactory can't find $T");
    }
  }
}