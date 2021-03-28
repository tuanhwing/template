
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/blocs/pages/tp_anonymous_bloc.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/ui/screens/home_flow/main/widgets/home_main_percent_widget.dart';
import 'package:template/ui/screens/home_flow/main/widgets/home_main_summary_widget.dart';
import 'package:template/utils/tp_dimensions.dart';
import 'package:template/utils/tp_mockup.dart';

class HomeMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeMainState();

}

class _HomeMainState extends TPState<TPAnonymousBloc, HomeMainScreen> {

  @override
  Widget get content => Container(
    width: double.infinity,
    height: double.infinity,
    child: SafeArea(
      child: Column(
        children: [
          HomeMainSummaryWidget(),
          SizedBox(height: TPDimensions.DIMENSION_8,),
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: TPDimensions.DIMENSION_8,),
                  HomeMainPercentWidget(
                    footerString: TPMockUp.STRING_TITLE,
                    percent: 56.0,
                  ),
                  HomeMainPercentWidget(
                    footerString: TPMockUp.STRING_TITLE,
                    percent: 24.5,
                  ),
                  HomeMainPercentWidget(
                    footerString: TPMockUp.STRING_TITLE,
                    percent: 53.1,
                  ),
                  HomeMainPercentWidget(
                    footerString: TPMockUp.STRING_TITLE,
                    percent: 94.2,
                  ),
                  HomeMainPercentWidget(
                    footerString: TPMockUp.STRING_TITLE,
                    percent: 5.1,
                  ),
                  SizedBox(width: TPDimensions.DIMENSION_8,),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );

}