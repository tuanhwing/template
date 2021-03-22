
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:template/blocs/pages/login_flow/login/supports/password_input.dart';
import 'package:template/blocs/pages/login_flow/login/supports/email_input.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  final FormzStatus status;
  final EmailInput email;
  final PasswordInput password;

  LoginState copyWith({
    FormzStatus status,
    EmailInput email,
    PasswordInput password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, password];
}