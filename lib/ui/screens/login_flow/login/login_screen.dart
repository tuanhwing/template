
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/blocs/pages/login/tp_login_bloc.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/ui/screens/login_flow/login_content_widget.dart';
import 'package:template/ui/widgets/tp_button.dart';
import 'package:template/ui/widgets/tp_textfield.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';
import 'package:template/core/extensions/string_extension.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginState();
}


class _LoginState extends TPState<TPLoginBloc, LoginScreen> {


  @override
  Widget get content => LoginContentWidget(
    titleKey: "login",
    child: SingleChildScrollView(
      child: Column(
        children: [
          TPTextField(
            title: tr('email').capitalizeFirstofEach,
            placeholder: tr('email_placeholder').capitalize,
            controller: bloc.emailTEC,
            stream: bloc.emailErrorStream,
          ),
          SizedBox(height: 2*TPDimensions.DIMENSION_8,),
          TPTextField(
            title: tr('password').capitalizeFirstofEach,
            placeholder: tr('password_placeholder').capitalize,
            obscureText: true,
            controller: bloc.passwordTEC,
            stream: bloc.passwordErrorStream,
          ),
          SizedBox(height: TPDimensions.DIMENSION_12,),
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: InkWell(
              onTap: bloc.forgetTap,
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
          TPButton(
            title: tr("login").capitalizeFirstofEach,
            onTap: bloc.login
          ),
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
                  onTap: bloc.signUpTap,
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