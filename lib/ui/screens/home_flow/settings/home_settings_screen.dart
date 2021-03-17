

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/ui/screens/home_flow/settings/bloc/home_settings_bloc.dart';
import 'package:template/ui/screens/home_flow/settings/bloc/home_settings_event.dart';
import 'package:template/ui/screens/home_flow/settings/widgets/home_setting_icon_widget.dart';
import 'package:template/ui/screens/home_flow/settings/widgets/home_setting_option_widget.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:template/utils/tp_fontsizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeSettingsState();

}

class _HomeSettingsState extends TPState<HomeSettingsBloc, HomeSettingsScreen> {

  final List<HomeSettingOptionVModel> _featuresFirst = [];
  final List<HomeSettingOptionVModel> _featuresSecond = [];

  ///PRIVATE METHODS
  List<Widget> _getFeatureList(List<HomeSettingOptionVModel> features) {
    return features.map((e) => HomeSettingOptionWidget(
      onTap: e.onTap,
      padding: TPDimensions.DIMENSION_8,
      widgets: [
        HomeSettingsIconWidget(
          e.iconData,
          backgroundColor: e.backgroundColor,
        ),
        SizedBox(width: TPDimensions.DIMENSION_8,),
        Expanded(
          child: Text(
            e.title,
            style: TextStyle(
              fontSize: TPFontSizes.SIZE_15
            ),
          )
        )
      ],
    )).toList();
  }

  @override
  void initState() {
    super.initState();
    _featuresFirst.add(HomeSettingOptionVModel(Icons.verified_user_sharp, TPColors.light, tr('vehicle_management').capitalize, onTap: () {
    }));
    _featuresFirst.add(HomeSettingOptionVModel(Icons.date_range, Colors.green, tr('document_management').capitalize, onTap: () {
    }));
    _featuresFirst.add(HomeSettingOptionVModel(Icons.record_voice_over, TPColors.cloud, tr('reviews').capitalize, onTap: () {
    }));
    _featuresFirst.add(HomeSettingOptionVModel(Icons.language, Colors.blue, tr('languages').capitalize, onTap: () {
    }));

    _featuresSecond.add(HomeSettingOptionVModel(Icons.notifications, Colors.lightBlueAccent, tr('notifications').capitalize, onTap: () {
    }));
    _featuresSecond.add(HomeSettingOptionVModel(Icons.policy, Colors.black38, tr('terms_privacy_policy').capitalize, onTap: () {
    }));
    _featuresSecond.add(HomeSettingOptionVModel(Icons.help, Colors.redAccent, tr('contact_us').capitalize, onTap: () {
    }));
    _featuresSecond.add(HomeSettingOptionVModel(Icons.logout, TPColors.cloud, tr('logout').capitalize, onTap: (){
      bloc.add(HomeSettingLogoutRequested());
    }));
  }

  @override
  Color get backgroundColor => TPColors.cloud.withOpacity(0.4);

  @override
  Widget get content => SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2*TPDimensions.DIMENSION_8),
        child: Column(
          children: [
            HomeSettingOptionWidget(
              padding: 2*TPDimensions.DIMENSION_8,
              widgets: [
                Container(
                  height: 4*TPDimensions.DIMENSION_15,
                  width: 4*TPDimensions.DIMENSION_15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: TPColors.black
                  ),
                ),
                SizedBox(width: 2*TPDimensions.DIMENSION_12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.read<TPAuthenticationBloc>().state.user?.username ?? "",
                        style: TextStyle(
                          fontSize: TPFontSizes.SIZE_16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 2*TPDimensions.DIMENSION_15,),
            Column(
              children:   _getFeatureList(_featuresFirst),
            ),
            SizedBox(height: 2*TPDimensions.DIMENSION_15,),
            Column(
              children: _getFeatureList(_featuresSecond),
            ),
          ],
        ),
      ),
    ),
  );

}