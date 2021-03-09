

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';

///Info model
class HomeSettingOptionVModel {
  HomeSettingOptionVModel(this._iconData, this._backgroundColor, this._title, {this.onTap});
  final IconData _iconData;
  final Color _backgroundColor;
  final String _title;
  final Function onTap;

  IconData get iconData => _iconData;
  Color get backgroundColor => _backgroundColor;
  String get title => _title;
}

class HomeSettingOptionWidget extends StatelessWidget {
  HomeSettingOptionWidget({this.padding, this.widgets, this.onTap});
  final double padding;
  final List<Widget> widgets;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    widgets.add(Icon(
      Icons.navigate_next,
      size: 2*TPDimensions.DIMENSION_15,
    )
    );
    return InkWell(
      onTap: onTap,
      child: Container(
        color: TPColors.white,
        margin: EdgeInsets.only(bottom: TPDimensions.DIMENSION_8/4),
        padding: EdgeInsets.only(left: padding, top: padding, bottom: padding, right: TPDimensions.DIMENSION_8),
        child: Row(
          children: widgets,
        ),
      ),
    );
  }
}