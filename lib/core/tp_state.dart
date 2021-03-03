

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:template/blocs/tp_page_bloc.dart';
import 'package:template/core/factory/tp_bloc_factory.dart';
import 'package:template/core/tp_page.dart';

abstract class TPState<Bloc extends TPPageBloc, StateWidget extends StatefulWidget> extends State<StateWidget> {
  Bloc bloc;//bloc for this state


  ///REQUIRE
  Widget get content;

  ///[START]OPTIONAL
  bool get isShowLoading => true;//show loading
  bool get isShowErrorNotification => true;//show error notification
  PreferredSizeWidget get appBar => null;

  void onPostFrame() {}
  ///[END]OPTIONAL

  void _onErrorTap() {
    bloc.loadingStreamController.sink.add(false);
  }

  @override
  void initState() {
    super.initState();

    bloc = TPBlocFactory.of<Bloc>(context);

    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      onPostFrame();
    });
  }


  @override
  Widget build(BuildContext context) {
    return TPPage(
      content,
      _onErrorTap,
      bloc.loadingStream,
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}