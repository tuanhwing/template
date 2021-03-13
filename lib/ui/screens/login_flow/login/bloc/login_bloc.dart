

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:template/core/network/tp_response.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_event.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_state.dart';
import 'package:template/ui/screens/login_flow/login/models/password_input.dart';
import 'package:template/ui/screens/login_flow/login/models/username_input.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required TPUserRepository userRepository}) :
      assert(userRepository != null),
      _userRepository = userRepository,
      super(const LoginState());

  final TPUserRepository _userRepository;

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is LoginEmailChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  LoginState _mapUsernameChangedToState(
      LoginEmailChanged event,
      LoginState state,
      ) {
    final username = EmailInput.dirty(value: event.email);
    return state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    );
  }

  LoginState _mapPasswordChangedToState(
      LoginPasswordChanged event,
      LoginState state,
      ) {
    final password = PasswordInput.dirty(value: event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(
      LoginSubmitted event,
      LoginState state,
      ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        TPResponse response = await _userRepository.login(
          state.username.value,
          state.password.value,
        );
        if (response.code == TPResponseCode.SUCCESS) {
          yield state.copyWith(status: FormzStatus.submissionSuccess);
        }
        else {
          yield state.copyWith(status: FormzStatus.submissionFailure);
        }
      } on Exception catch (_) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}