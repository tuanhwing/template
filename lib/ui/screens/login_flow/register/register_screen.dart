
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/blocs/pages/login/tp_register_bloc.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/ui/screens/login_flow/login_content_widget.dart';
import 'package:template/ui/widgets/tp_button.dart';
import 'package:template/ui/widgets/tp_textfield.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:template/utils/tp_dimensions.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}


class _RegisterState extends TPState<TPRegisterBloc, RegisterScreen> {
  @override
  // TODO: implement content
  Widget get content => LoginContentWidget(
    titleKey: "sign_up",
    child: SingleChildScrollView(
      child: Column(
        children: [
          TPTextField(
            title: tr('name').capitalizeFirstofEach,
            placeholder: tr('name_placeholder').capitalize,
            controller: bloc.nameTEC,
            stream: bloc.nameErrorStream,
          ),
          SizedBox(height: 2*TPDimensions.DIMENSION_8,),
          TPTextField(
            title: tr('email').capitalizeFirstofEach,
            placeholder: tr('email_placeholder').capitalize,
            controller: bloc.emailTEC,
            stream: bloc.emailErrorStream,
          ),
          SizedBox(height: 2*TPDimensions.DIMENSION_8,),
          TPTextField(
            title: tr('contact_no').capitalizeFirstofEach,
            placeholder: tr('contact_no_placeholder').capitalize,
            controller: bloc.phoneTEC,
            stream: bloc.phoneErrorStream,
          ),
          SizedBox(height: 2*TPDimensions.DIMENSION_8,),
          TPTextField(
            title: tr('password').capitalizeFirstofEach,
            placeholder: tr('password_placeholder').capitalize,
            obscureText: true,
            controller: bloc.passwordTEC,
            stream: bloc.passwordErrorStream,
          ),
          SizedBox(height: 2*TPDimensions.DIMENSION_8,),
          TPTextField(
            title: tr('confirm_password').capitalizeFirstofEach,
            placeholder: tr('confirm_password_placeholder').capitalize,
            obscureText: true,
            controller: bloc.confirmPasswordTEC,
            stream: bloc.passwordConfirmErrorStream,
          ),
          SizedBox(height: 2*TPDimensions.DIMENSION_12,),

          TPButton(
              title: tr("sign_up").capitalizeFirstofEach,
              onTap: bloc.register
          ),
        ],
      )
    ),
  );

}