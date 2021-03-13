
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/factory/tp_reposity_factory.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/repositories/tp_user_repository.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_bloc.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_event.dart';
import 'package:template/ui/screens/login_flow/login/bloc/login_state.dart';
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


class _LoginState extends TPState<LoginBloc, LoginScreen> {

  @override
  LoginBloc get bloc => LoginBloc(userRepository: TPRepositoryFactory.of<TPUserRepository>(context));

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
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: InkWell(
              // onTap: bloc.forgetTap,
              child: Text(
                tr('forget_password').capitalize + "?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TPFontSizes.SIZE_16,
                    color: TPColors.cloud
                ),
              ),
            ),
          ),
          SizedBox(height: 2*TPDimensions.DIMENSION_12,),
          _LoginButtonWidget(),
          Container(
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
                  // onTap: bloc.signUpTap,
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
          ),
        ],
      ),
    ),
  );
}

class _LoginEmailInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
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
              onChanged: (username) =>
                  context.read<LoginBloc>().add(LoginEmailChanged(username)),
              decoration: InputDecoration(
                hintText: tr('email_placeholder').capitalize,
                hintStyle: TextStyle(
                    color: TPColors.cloud
                ),
                errorText: state.username.invalid ? (tr("email").capitalize + " " + tr("invalid")) : null,

              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoginPasswordInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
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
              key: const Key('loginForm_usernameInput_textField'),
              onChanged: (password) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText: true,
              decoration: InputDecoration(
                hintText: tr('password_placeholder').capitalize,
                hintStyle: TextStyle(
                    color: TPColors.cloud
                ),
                errorText: state.password.invalid ? (tr("password").capitalize + " " + tr("invalid")) : null,

              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoginButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress ? const CircularProgressIndicator() : TPButton(
          title: tr("login").capitalizeFirstofEach,
          onTap: state.status.isValidated ? () {
            context.read<LoginBloc>().add(const LoginSubmitted());
          } : null,
        );
      },
    );
  }
}