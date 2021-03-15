
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_event.dart';
import 'package:template/blocs/authentication/tp_authentication_state.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:template/core/tp_network_requester.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_authentication_repository.dart';
import 'package:template/utils/tp_defines.dart';
import 'package:template/utils/tp_utils.dart';

class TPAuthenticationBloc extends Bloc<TPAuthenticationEvent, TPAuthenticationState> {
  TPAuthenticationBloc(this._authenticationRepository) :
        assert(_authenticationRepository != null),
        super(const TPAuthenticationState()) {
    _authenticationRepository.status.listen((event) {

    });
  }


  final TPAuthenticationRepository _authenticationRepository;

  @override
  Stream<TPAuthenticationState> mapEventToState(TPAuthenticationEvent event) async* {
    if (event is TPAuthenticationStatusChanged) {
      yield await _mapStatusChangedToState(event.status, user: event.user);
    } else if (event is TPAuthenticationLogoutRequested) {
      yield await _logout(TPAuthenticationStatus.unauthenticated);
    } else if (event is TPAuthenticationTokenExpired) {
      yield await _logout(TPAuthenticationStatus.session_expired);
    } else if (event is TPAuthenticationCheckSession) {
      yield await _checkUserSession();
    }
  }

  Future<TPAuthenticationState> _mapStatusChangedToState(TPAuthenticationStatus status, {TPUserModel user}) async {
    if (status == TPAuthenticationStatus.authenticated && user != null) {
      String data = json.encode(user.toJson());
      await TPUtils.saveData(TPDefines.USER_INFO_KEY, data);
    }
    return TPAuthenticationState(status: status, user: user);
  }

  Future<TPAuthenticationState> _logout(TPAuthenticationStatus status) async {
    _authenticationRepository.logout();
    await TPUtils.deleteData(TPDefines.USER_INFO_KEY);
    await TPUtils.deleteData(TPDefines.TOKEN_KEY);
    await TPUtils.deleteData(TPDefines.REFRESH_TOKEN_KEY);
    return TPAuthenticationState(status: status);
  }

  Future<TPAuthenticationState> _checkUserSession() async {
    await Future.delayed(Duration(seconds: 1));
    String data = await TPUtils.loadData(TPDefines.USER_INFO_KEY);
    String token = await TPUtils.loadData(TPDefines.TOKEN_KEY);
    String refreshToken = await TPUtils.loadData(TPDefines.REFRESH_TOKEN_KEY);

    if (data != null && !StringExtension.isNullOrEmpty(token) && !StringExtension.isNullOrEmpty(refreshToken)) {
      TPNetworkRequester().setToken(token, refreshToken);
      return TPAuthenticationState(status: TPAuthenticationStatus.authenticated, user: TPUserModel.fromJson(json.decode(data)));
    }

    return TPAuthenticationState(status: TPAuthenticationStatus.unauthenticated);
  }
}