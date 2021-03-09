
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/blocs/pages/home/home_main_bloc.dart';
import 'package:template/core/tp_state.dart';
import 'package:template/ui/screens/home_flow/main/widgets/home_main_percent_widget.dart';
import 'package:template/ui/screens/home_flow/main/widgets/home_main_summary_widget.dart';
import 'package:template/utils/tp_colors.dart';
import 'package:template/utils/tp_dimensions.dart';

class HomeMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeMainState();

}

class _HomeMainState extends TPState<HomeMainBloc, HomeMainScreen> {
  @override
  Widget get content => Stack(
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                TPColors.light_blue,
                TPColors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment(0.2, 0.0), // 10% of the width, so there are ten blinds.
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
      Container(
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
                        footerString: "Temporary",
                        percent: 56.0,
                        progressColor: Colors.green,
                      ),
                      HomeMainPercentWidget(
                        footerString: "Temporary",
                        percent: 24.5,
                      ),
                      HomeMainPercentWidget(
                        footerString: "Temporary",
                        percent: 53.1,
                      ),
                      HomeMainPercentWidget(
                        footerString: "Temporary",
                        percent: 94.2,
                      ),
                      HomeMainPercentWidget(
                        footerString: "Temporary",
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
      )
    ],
  );

}