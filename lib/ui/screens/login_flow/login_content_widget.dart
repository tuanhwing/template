

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/core/tp_navigator.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:template/utils/tp_routenames.dart';

class LoginContentWidget extends StatelessWidget {
  LoginContentWidget({@required this.child, @required this.titleKey}) : assert(child != null && titleKey != null);
  final Widget child;
  final String titleKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          height: double.infinity,
          color: TPColors.cloud,
          child: ModalRoute.of(context).settings.name != TPRouteNames.LOGIN ? SafeArea(
            child: GestureDetector(
              onTap: () {
                TPNavigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: TPDimensions.DIMENSION_8),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: TPColors.black,
                  size: 2*TPDimensions.DIMENSION_15,
                ),
              ),
            ),
          ) : SizedBox(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 2*TPDimensions.DIMENSION_8),
                decoration: BoxDecoration(
                    color: TPColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(2*TPDimensions.DIMENSION_15),
                      topLeft: Radius.circular(2*TPDimensions.DIMENSION_15),
                    )
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:2*TPDimensions.DIMENSION_12),
                        child: Text(
                          titleKey != null ? tr(titleKey).allInCaps : "",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: TPFontSizes.SIZE_25
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: TPDimensions.DIMENSION_12),
                            child: child
                        ),
                      ),
                      SizedBox(height: 2*TPDimensions.DIMENSION_8,)
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ],
    );
  }

}