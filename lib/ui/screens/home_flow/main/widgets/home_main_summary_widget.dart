
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';

class HomeMainSummaryWidget extends StatelessWidget {

  final String _defaultString = "--:--";

  Widget _buildColumnInfo(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: TPColors.cloud
          ),
        ),
        SizedBox(height: TPDimensions.DIMENSION_8,),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 2*TPDimensions.DIMENSION_8,
          vertical: 2*TPDimensions.DIMENSION_8
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: TPColors.white,
          fontSize: TPFontSizes.SIZE_16,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Temporary",
                  style: TextStyle(
                      color: TPColors.cloud,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: TPDimensions.DIMENSION_8/2,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      size: 2*TPDimensions.DIMENSION_12,
                      color: TPColors.white,
                    ),
                    Text(
                      "123.7",
                      style: TextStyle(
                        fontSize: TPFontSizes.SIZE_40,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(width: 2*TPDimensions.DIMENSION_8,),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: TPDimensions.DIMENSION_8),
                padding: EdgeInsets.symmetric(
                    horizontal: TPDimensions.DIMENSION_8,
                    vertical: 2*TPDimensions.DIMENSION_12
                ),
                decoration: BoxDecoration(
                    color: TPColors.light_blue.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(TPDimensions.DIMENSION_12))
                ),
                child:  Row(
                  children: [
                    Expanded(
                      child: _buildColumnInfo("Temporary", _defaultString),
                    ),
                    Expanded(
                      child: _buildColumnInfo("Temporary", _defaultString),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}