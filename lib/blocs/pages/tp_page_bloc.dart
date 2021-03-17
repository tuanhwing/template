


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/ui/common/page/cubit/page_cubit.dart';

abstract class TPPageBloc<Event, State> extends Bloc<Event, State> {
  TPPageBloc(BuildContext context, State initialState) : assert(context != null), super(initialState) {
    _context = context;
  }

  BuildContext _context;
  PageCubit _pageCubit = PageCubit();

  BuildContext get context => _context;
  PageCubit get pageCubit => _pageCubit;

}