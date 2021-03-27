
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/tp_back_platform_observer.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/blocs/pages/login_flow/login/login_bloc.dart';
import 'package:template/blocs/pages/login_flow/login/login_event.dart';
import 'package:template/blocs/pages/login_flow/login/login_state.dart';
import 'package:template/blocs/pages/login_flow/login/supports/email_input.dart';
import 'package:template/blocs/pages/login_flow/login/supports/password_input.dart';
import 'package:template/ui/screens/login_flow/login_content_widget.dart';
import 'package:template/ui/common/tp_button.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:formz/formz.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginState();
}


class _LoginState extends TPState<LoginBloc, LoginScreen> implements TPBackPlatformListener {

  @override
  void onTapBackPlatform() {
    TPNavigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    TPBackPlatformObserver().addListener(this);
  }

  @override
  void dispose() {
    TPBackPlatformObserver().removeListener(this);
    super.dispose();
  }

  @override
  Widget get content => LoginContentWidget(
    titleKey: "login",
    child: SingleChildScrollView(
      child: Column(
        children: [
          _LoginEmailInputWidget(),
          SizedBox(height: 2*TPDimensions.DIMENSION_8,),
          _LoginPasswordInputWidget(),
          SizedBox(height: TPDimensions.DIMENSION_12,),
          _ForgetPasswordWidget(),
          SizedBox(height: 2*TPDimensions.DIMENSION_12,),
          _LoginButtonWidget(),
          _SignUpWidget()
        ],
      ),
    ),
  );
}

class _LoginEmailInputWidget extends StatelessWidget {
  String _getEmailError(EmailInputError error) {
    switch(error) {
      case EmailInputError.empty:
        return tr("email").capitalize + " " + tr("must_be_not_empty");
      case EmailInputError.invalid:
        return tr("email").capitalize + " " + tr("invalid");
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('email').capitalizeFirstofEach,
              style: TextStyle(
                  fontSize: TPFontSizes.SIZE_18,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              key: const Key('loginForm_usernameInput_textField'),
              onChanged: (username) => context.read<LoginBloc>().add(LoginEmailChanged(username)),
              decoration: InputDecoration(
                hintText: tr('email_placeholder').capitalize,
                hintStyle: TextStyle(
                    color: TPColors.cloud
                ),
                errorText: state.email.invalid ? _getEmailError(state.email.error) : null,

              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoginPasswordInputWidget extends StatelessWidget {

  String _getPasswordError(PasswordInputError error) {
    switch(error) {
      case PasswordInputError.empty:
        return tr("password").capitalize + " " + tr("must_be_not_empty");
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('password').capitalizeFirstofEach,
              style: TextStyle(
                  fontSize: TPFontSizes.SIZE_18,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText: true,
              decoration: InputDecoration(
                hintText: tr('password_placeholder').capitalize,
                hintStyle: TextStyle(
                    color: TPColors.cloud
                ),
                errorText: state.password.invalid ? _getPasswordError(state.password.error) : null,

              ),
            ),
          ],
        );
      },
    );
  }
}

class _SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2*TPDimensions.DIMENSION_12),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr('do_not_have_an_account').capitalize + " ? ",
            style: TextStyle(
                fontSize: TPFontSizes.SIZE_16,
                color: TPColors.cloud
            ),
          ),
          GestureDetector(
            onTap: () => context.read<LoginBloc>().add(SignUpTaped()),
            child: Text(
              tr('sign_up').capitalize,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TPFontSizes.SIZE_16,
                  color: TPColors.cloud
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ForgetPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      child: InkWell(
        onTap: () => context.read<LoginBloc>().add(ForgetPasswordTaped()),
        child: Text(
          tr('forget_password').capitalize + "?",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TPFontSizes.SIZE_16,
              color: TPColors.cloud
          ),
        ),
      ),
    );
  }

}

class _LoginButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return TPButton(
          title: tr("login").capitalizeFirstofEach + (state.status.isSubmissionInProgress ? "..." : ""),
          onTap: state.status.isValidated ? () {
            context.read<LoginBloc>().add(const LoginSubmitted());
          } : null,
        );
      },
    );
  }
}