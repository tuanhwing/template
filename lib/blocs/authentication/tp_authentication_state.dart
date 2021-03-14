
import 'package:equatable/equatable.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_authentication_repository.dart';

class TPAuthenticationState extends Equatable {
  const TPAuthenticationState({this.status, this.user});
  final TPAuthenticationStatus status;
  final TPUserModel user;

  @override
  List<Object> get props => [status, user];
}