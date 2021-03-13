
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';
import 'package:template/core/extensions/string_extension.dart';

class TPPage extends StatelessWidget {
  TPPage(
    this._body,
    this._onErrorTap,
    // this._stream,
    {this.appBar,
    this.backgroundColor,
    this.enableLoading = true,
    this.enableErrorNotification = true}) : assert(_body != null && _onErrorTap != null);

  final Widget _body;
  final VoidCallback _onErrorTap;
  // final Stream<bool> _stream;

  final backgroundColor;
  final PreferredSizeWidget appBar;
  final bool enableLoading;
  final bool enableErrorNotification;

  Widget _buildTextTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TPFontSizes.SIZE_18
      ),
    );
  }

  ///Loading widget
  Widget get _loadingWidget => Container(
    color: Colors.black38,
    child: Center(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                  Radius.circular(TPDimensions.DIMENSION_8))
          ),
          padding: EdgeInsets.all(2 * TPDimensions.DIMENSION_8),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(TPColors.cloud),
          )
      ),
    ),
  );

  ///Function to detect show loading/error
  Widget _handle(AsyncSnapshot<bool> snapshot) {
    if (snapshot.hasError) return Container(
      color: Colors.black38,
      child: Center(
          child: Wrap(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 2*TPDimensions.DIMENSION_10*TPDimensions.DIMENSION_15
                ),
                padding: EdgeInsets.symmetric(vertical: TPDimensions.DIMENSION_8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TPDimensions.DIMENSION_15),
                  color: TPColors.white,

                ),
                child: Column(
                  children: [
                    _buildTextTitle(tr('notify').capitalize),
                    SizedBox(height: TPDimensions.DIMENSION_12,),
                    Text(snapshot.error.toString()),
                    SizedBox(height: TPDimensions.DIMENSION_8/2,),
                    Divider(
                        color: Colors.black54
                    ),
                    SizedBox(height: TPDimensions.DIMENSION_8/2,),
                    InkWell(
                      onTap: _onErrorTap,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: _buildTextTitle(tr('ok').allInCaps)
                      ),
                    ),
                    SizedBox(height: TPDimensions.DIMENSION_8/2,),
                  ],
                ),
              )
            ],
          )
      ),
    );

    return snapshot.hasData && snapshot.data ? _loadingWidget : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: Stack(
        children: [
          _body,
          StreamBuilder<bool>(
            // stream: _stream,
            builder: (_, snapshot) {
              return _handle(snapshot);
            },
          )
        ],
      ),
    );
  }

}