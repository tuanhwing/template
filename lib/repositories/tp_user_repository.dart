

import 'package:flutter/src/widgets/framework.dart';
import 'package:template/core/network/tp_endpoints.dart';
import 'package:template/core/network/tp_request.dart';
import 'package:template/core/network/tp_response.dart';
import 'package:template/repositories/tp_repository.dart';
import 'package:template/utils/tp_mockup.dart';

class TPUserRepository extends TPRepository {
  TPUserRepository(BuildContext context) : super(context);

  Future<TPResponse> login(String username, String password) async {
    // Map<String, dynamic> data = {
    //   'username' : username,
    //   'password' : password
    // };
    // return requester.executeRequest(TPRequestMethod.POST, TPEndpoints.LOGIN, data: data);


    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> responseData = {
      'username' : username,
    };
    responseData.addAll(TPMockUp.LOGIN_SUCCESS_DATA);
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: responseData);
  }

  Future<TPResponse> register(Map<String, dynamic> data) {

  }
}