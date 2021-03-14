

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';
import 'package:template/core/extensions/string_extension.dart';

class TPButton extends StatelessWidget {
  TPButton({this.title, this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: TPDimensions.DIMENSION_8),
        padding: EdgeInsets.symmetric(vertical: 2*TPDimensions.DIMENSION_8),
        decoration: BoxDecoration(
          color: onTap == null ? TPColors.black.withOpacity(0.2) : TPColors.black,
          borderRadius: BorderRadius.all(Radius.circular(2*TPDimensions.DIMENSION_12))
        ),
        child: Text(
          title.capitalizeFirstofEach,
          style: TextStyle(
            color: TPColors.cloud,
            fontSize: TPFontSizes.SIZE_18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }


}