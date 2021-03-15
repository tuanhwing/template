

import 'package:equatable/equatable.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_authentication_repository.dart';

class TPAuthenticationEvent extends Equatable {
  const TPAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class TPAuthenticationStatusChanged extends TPAuthenticationEvent {
  const TPAuthenticationStatusChanged(this.status, {this.user});
  final TPAuthenticationStatus status;
  final TPUserModel user;

  @override
  List<Object> get props => [status, user];
}

class TPAuthenticationLogoutRequested extends TPAuthenticationEvent {

}

class TPAuthenticationTokenExpired extends TPAuthenticationEvent {
}

class TPAuthenticationCheckSession extends TPAuthenticationEvent {
}

