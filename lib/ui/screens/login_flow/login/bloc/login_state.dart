
import 'package:formz/formz.dart';
import 'package:template/ui/screens/login_flow/login/models/password_input.dart';
import 'package:template/ui/screens/login_flow/login/models/username_input.dart';

class LoginState {
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  final FormzStatus status;
  final EmailInput username;
  final PasswordInput password;

  LoginState copyWith({
    FormzStatus status,
    EmailInput username,
    PasswordInput password,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}