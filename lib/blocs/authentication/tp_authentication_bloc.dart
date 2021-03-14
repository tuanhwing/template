
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_event.dart';
import 'package:template/blocs/authentication/tp_authentication_state.dart';
import 'package:template/models/tp_user_model.dart';
import 'package:template/repositories/tp_authentication_repository.dart';

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
      yield _mapStatusChangedToState(event.status, user: event.user);
    } else if (event is TPAuthenticationLogoutRequested) {
      yield await _logout();
      yield _mapStatusChangedToState(TPAuthenticationStatus.unauthenticated);
    }
  }

  TPAuthenticationState _mapStatusChangedToState(TPAuthenticationStatus status, {TPUserModel user}) {
    return TPAuthenticationState(status: status, user: user);
  }

  Future<TPAuthenticationState> _logout() async {
    _authenticationRepository.logout();
    return TPAuthenticationState(status: TPAuthenticationStatus.unauthenticated, user: null);
  }
}