
import 'package:flutter/cupertino.dart';
import 'package:template/utils/tp_dimensions.dart';

class HomeSettingsIconWidget extends StatelessWidget {

  HomeSettingsIconWidget(this.icon, {this.backgroundColor});
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TPDimensions.DIMENSION_10/2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(TPDimensions.DIMENSION_8)),
            color: backgroundColor
        ),
        child: Icon(icon)
    );
  }
}