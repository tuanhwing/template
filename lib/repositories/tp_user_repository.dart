

import 'package:flutter/src/widgets/framework.dart';
import 'package:template/core/network/tp_response.dart';
import 'package:template/repositories/tp_repository.dart';
import 'package:template/utils/tp_mockup.dart';

class TPUserRepository extends TPRepository {
  TPUserRepository(BuildContext context) : super(context);

  ///Get profile's user
  ///param - email is temporary
  Future<TPResponse> getUser({String email}) async {

    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> responseData = {
      'username' : email
    };
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: responseData);
  }

  ///Register
  Future<TPResponse> register(Map<String, dynamic> data) async {
    await Future.delayed(Duration(seconds: 1));
    return TPResponse(code: TPResponseCode.SYSTEM_ERROR, message: "", data: {});
  }

  ///Log-out
  Future<TPResponse> logout() async {
    // Map<String, dynamic> data = {
    //   'username' : username,
    //   'password' : password
    // };
    // return requester.executeRequest(TPRequestMethod.POST, TPEndpoints.LOGIN, data: data);


    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: {});
  }
}