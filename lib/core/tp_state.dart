import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/factory/tp_bloc_factory.dart';
import 'package:template/blocs/pages/tp_page_bloc.dart';
import 'package:template/ui/common/page/cubit/page_cubit.dart';
import 'package:template/ui/common/page/tp_page_widget.dart';

abstract class TPState<PageBloc extends TPPageBloc, StateWidget extends StatefulWidget> extends State<StateWidget> {
  PageBloc _bloc;//bloc for this state

  ///REQUIRE
  Widget get content;

  ///[START]OPTIONAL
  bool get isShowLoading => true;//show loading
  bool get isShowErrorNotification => true;//show error notification
  PreferredSizeWidget get appBar => null;
  Color get backgroundColor => null;

  void onPostFrame() {}
  ///[END]OPTIONAL

  PageBloc get bloc => _bloc;

  void _onErrorTap() {
    _bloc.pageCubit.dismiss();
  }

  @override
  void initState() {
    super.initState();

    _bloc = TPBlocFactory.of<PageBloc>(context);

    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      onPostFrame();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageCubit>(
          create: (_) => _bloc.pageCubit,
        ),
        BlocProvider<PageBloc>(
            create: (_) => _bloc,
        ),
      ],
      child: TPPageWidget(
        content,
        _onErrorTap,
        appBar: appBar,
        backgroundColor: backgroundColor,
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}