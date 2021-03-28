
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/ui/common/page/cubit/page_cubit.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_fontsizes.dart';
import 'package:template/core/extensions/string_extension.dart';

class TPPageWidget extends StatelessWidget {
  TPPageWidget(
    this._body,
    this._onErrorTap,
    {this.appBar,
    this.backgroundColor,
    this.enableLoading = true,
    this.enableErrorNotification = true}) : assert(_body != null && _onErrorTap != null);

  final Widget _body;
  final VoidCallback _onErrorTap;

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
  Widget _loadingWidget(String message, {BuildContext context}) => Container(
    child: Center(
      child: Wrap(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(TPDimensions.DIMENSION_8))
              ),
              padding: EdgeInsets.all(2 * TPDimensions.DIMENSION_8),
              child: Column(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(height: StringExtension.isNullOrEmpty(message) ? TPDimensions.DIMENSION_ZERO : TPDimensions.DIMENSION_8,),
                  message != null ? Text(message) : SizedBox()
                ],
              ),
          ),

        ],
      ),
    ),
  );

  ///Error widget
  Widget _errorWidget(String error, {BuildContext context}) => Container(
    // color: Colors.black38,
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
                color: Theme.of(context).colorScheme.surface,

              ),
              child: Column(
                children: [
                  _buildTextTitle(tr('notify').capitalize),
                  SizedBox(height: TPDimensions.DIMENSION_12,),
                  Text(error ?? ""),
                  SizedBox(height: TPDimensions.DIMENSION_8/2,),
                  Divider(
                      // color: Colors.black54
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

  Widget _handle(TPPageState state, {BuildContext context}) {
    switch(state.action) {
      case PageAction.error:
        return Container(
          color: Theme.of(context).colorScheme.secondaryVariant,
          child: _errorWidget(state.message, context: context)
        );
      case PageAction.loading:
        return Container(
          color: Theme.of(context).colorScheme.secondaryVariant,
          child: _loadingWidget(state.message, context: context)
        );
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: Stack(
        children: [
          _body,
          BlocBuilder<PageCubit, TPPageState>(
            builder: (_, state) => _handle(state, context: context),
          )
        ],
      ),
    );
  }

}