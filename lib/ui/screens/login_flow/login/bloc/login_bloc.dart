

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_event.dart';
import 'package:template/core/network/tp_response.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/blocs/pages/tp_page_bloc.dart';
import 'package:template/core/tp_network_requester.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_event.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_state.dart';
import 'package:template/ui/screens/login_flow/login/supports/password_input.dart';
import 'package:template/ui/screens/login_flow/login/supports/email_input.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:template/utils/tp_routenames.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends TPPageBloc<LoginEvent, LoginState> {
  LoginBloc({
    @required BuildContext context,
    @required TPAuthenticationRepository authenticationRepository,
    @required TPUserRepository userRepository
  }) : assert(authenticationRepository != null),
        assert(userRepository != null),
        _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(context, const LoginState());

  final TPAuthenticationRepository _authenticationRepository;
  final TPUserRepository _userRepository;

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is LoginEmailChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is SignUpTaped) {
      _navigateToSignUp();
    } else if (event is ForgetPasswordTaped) {
      pageCubit.showError(message: tr('feature_not_available').capitalize + "!");
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
      email: username,
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
      status: Formz.validate([password, state.email]),
    );
  }

  ///navigate to SignUp Screen
  void _navigateToSignUp() {
    TPNavigator.pushNamed(context, TPRouteNames.REGISTER);
  }

  Stream<LoginState> _mapLoginSubmittedToState(
      LoginSubmitted event,
      LoginState state,
      ) async* {
    if (state.status.isValidated) {
      pageCubit.showLoading();//show loading
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        TPResponse response = await _authenticationRepository.login(
          state.email.value,
          state.password.value,
        );
        String _errorMessage = response.message;
        if (response.code == TPResponseCode.SUCCESS) {
          await TPNetworkRequester().setToken(response.data['token'], response.data['refresh_token']);
          TPResponse profileResponse = await _userRepository.getUser(email: state.email.value);
          _errorMessage = profileResponse.message;
          if (profileResponse.code == TPResponseCode.SUCCESS) {
            yield state.copyWith(status: FormzStatus.submissionSuccess);
            context.read<TPAuthenticationBloc>().add(TPAuthenticationStatusChanged(TPAuthenticationStatus.authenticated, user: TPUserModel.fromJson(profileResponse.data)));
            pageCubit.dismiss();//dismiss loading
            return;
          }
        }
        pageCubit.showError(message: _errorMessage);//show error
        yield state.copyWith(status: FormzStatus.submissionFailure);
      } on Exception catch (_) {
        pageCubit.showError(message: tr("something_went_wrong").capitalize + "!");//show error
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}