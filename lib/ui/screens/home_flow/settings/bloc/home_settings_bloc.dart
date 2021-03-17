
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_event.dart';
import 'package:template/blocs/pages/tp_page_bloc.dart';
import 'package:template/ui/screens/home_flow/settings/bloc/home_settings_event.dart';
import 'package:template/ui/screens/home_flow/settings/bloc/home_settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/utils/tp_utils.dart';
import 'package:template/core/extensions/string_extension.dart';

class HomeSettingsBloc extends TPPageBloc<HomeSettingsEvent, HomeSettingsState> {
  HomeSettingsBloc(BuildContext context) : super(context, const HomeSettingsState());

  @override
  Stream<HomeSettingsState> mapEventToState(HomeSettingsEvent event) async* {
    if (event is HomeSettingLogoutRequested) {
      TPUtils.showConfirmDialog(
        context,
        useRootNavigator: true,
        message: tr('do_you_really_want_to_logout').capitalize + "?",
        yes: () {
          context.read<TPAuthenticationBloc>().add(TPAuthenticationLogoutRequested());
        }
      );
    }
  }


}