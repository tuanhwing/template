

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PageAction {
  none,
  loading,
  error
}

class TPPageState {
  TPPageState({this.action = PageAction.none, this.message}) : assert(action != null);
  final PageAction action;
  final String message;
}

class PageCubit extends Cubit<TPPageState> {
  PageCubit() : super(TPPageState());

  void dismiss() => emit(TPPageState());
  void showLoading({String message}) => emit(TPPageState(action: PageAction.loading, message: message));
  void showError({String message}) => emit(TPPageState(action: PageAction.error, message: message));
}