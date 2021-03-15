
import 'package:template/core/network/tp_response.dart';

class TPUserRepository {
  TPUserRepository() : super();

  ///Get profile's user
  ///param - email is temporary
  Future<TPResponse> getUser({String email}) async {
    // return TPNetworkRequester().executeRequest(TPRequestMethod.GET, TPEndpoints.USER_PROFILE);

    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> responseData = {
      'username' : email
    };
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: responseData);
  }

  ///Register
  Future<TPResponse> register(Map<String, dynamic> data) async {
    // return TPNetworkRequester().executeRequest(TPRequestMethod.POST, TPEndpoints.REGISTER, data: data);

    await Future.delayed(Duration(seconds: 1));
    return TPResponse(code: TPResponseCode.SYSTEM_ERROR, message: "", data: {});
  }

  ///Log-out
  Future<TPResponse> logout() async {
    // return TPNetworkRequester().executeRequest(TPRequestMethod.POST, TPEndpoints.LOGOUT,);


    //MOCKUP SUCCESS
    await Future.delayed(Duration(seconds: 1));
    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: {});
  }
}