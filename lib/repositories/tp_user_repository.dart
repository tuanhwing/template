

import 'package:template/core/network/tp_response.dart';

class TPUserRepository {
  Future<TPResponse> login(String username, String password) async {

    return TPResponse(code: TPResponseCode.SUCCESS, message: "", data: {});
  }
}