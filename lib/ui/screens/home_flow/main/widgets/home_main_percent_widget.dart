
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';

class HomeMainPercentWidget extends StatelessWidget {
  HomeMainPercentWidget({
    this.percent = 0.0,
    this.footerString,
    this.progressColor = TPColors.blue
  });
  final double percent;
  final String footerString;
  final Color progressColor;

  String _getPercentString(double percent) {
    int result = percent.round();
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: TPDimensions.DIMENSION_8),
      padding: EdgeInsets.only(
        left: 2*TPDimensions.DIMENSION_8,
        right: 2*TPDimensions.DIMENSION_8,
        bottom: 2*TPDimensions.DIMENSION_12,
        top: 3*TPDimensions.DIMENSION_12,
      ),
      decoration: BoxDecoration(
        color: TPColors.white,
        borderRadius: BorderRadius.all(Radius.circular(TPDimensions.DIMENSION_15)),
      ),
      child: CircularPercentIndicator(
        radius: TPDimensions.DIMENSION_12*TPDimensions.DIMENSION_10,
        lineWidth: TPDimensions.DIMENSION_15,
        animation: true,
        percent: percent/100.0,
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getPercentString(percent),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 2*TPFontSizes.SIZE_15),
            ),
            Text(
              "%",
            )
          ],
        ),
        footer: Text(
          footerString ?? "",
          style: Theme.of(context).textTheme.subtitle2
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: progressColor,
      ),
    );
  }

}