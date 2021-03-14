

import 'dart:async';

import 'package:template/core/network/tp_response.dart';
import 'package:template/utils/tp_mockup.dart';

enum TPAuthenticationStatus { unknown, authenticated, unauthenticated, session_expired }

class TPAuthenticationRepository {
  TPAuthenticationRepository();

  final _controller = StreamController<TPAuthenticationStatus>();

  Stream<TPAuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  void dispose() {
    _controller.close();
  }

  ///Refresh token
  Future<TPResponse> refreshToken(String refreshToken) async {
    // Map<String, dynamic> data = {
    //   'email' : email,
    //   'password' : password
    // };
    // return requester.executeRequest(TPRequestMethod.POST, TPEndpoints.LOGIN, data: data);


    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> responseData = {
    };
    responseData.addAll(TPMockUp.LOGIN_SUCCESS_DATA);
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: responseData);
  }

  ///Log-in
  Future<TPResponse> login(String email, String password) async {
    // Map<String, dynamic> data = {
    //   'email' : email,
    //   'password' : password
    // };
    // return requester.executeRequest(TPRequestMethod.POST, TPEndpoints.LOGIN, data: data);


    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> responseData = {
    };
    responseData.addAll(TPMockUp.LOGIN_SUCCESS_DATA);
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: responseData);
  }


  ///Log-out
  Future<TPResponse> logout() async {
    // Map<String, dynamic> data = {
    //   'email' : email,
    //   'password' : password
    // };
    // return requester.executeRequest(TPRequestMethod.POST, TPEndpoints.LOGIN, data: data);


    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> responseData = {
    };
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: responseData);
  }
}