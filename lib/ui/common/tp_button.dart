

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/tp_dimensions.dart';

class TPButton extends StatelessWidget {
  TPButton({this.title, this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(borderRadius: BorderRadius.circular(2*TPDimensions.DIMENSION_12));
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            Color color = Theme.of(context).buttonColor;
            if (states.contains(MaterialState.disabled)) {
              return color.withOpacity(0.5);
            }
            return color;
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).textTheme.button;
            }
            return Theme.of(context).textTheme.button;
          })
        ),
        onPressed: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: TPDimensions.DIMENSION_8),
          padding: EdgeInsets.symmetric(vertical: TPDimensions.DIMENSION_8),
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(title)
        )
    );
  }


}