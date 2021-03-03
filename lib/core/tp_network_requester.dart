
import 'package:template/core/network/tp_endpoints.dart';
import 'package:template/core/network/tp_request.dart';
import 'package:template/core/network/tp_response.dart';
import 'package:template/core/observers/tp_force_logout_observer.dart';

import 'package:template/core/config/tp_app_config.dart';
import 'package:template/core/tp_logger.dart';
import 'package:template/utils/tp_defines.dart';
import 'package:template/utils/tp_utils.dart';

class TPNetworkRequester {
  TPNetworkRequester(this._logoutObserver);
  TPRequest _request = TPRequest(TPAPIConfig[TPAppConfig.APP_ENVIROMENT]);

  String _token;
  String _refreshToken;
  String get token => _token;

  TPForceLogoutObserver _logoutObserver;


  Future setToken(String token, String refreshToken) async {
    _refreshToken = refreshToken;
    _token = token;
    await TPUtils.saveData(TPDefines.REFRESH_TOKEN_KEY, _refreshToken);
    await TPUtils.saveData(TPDefines.TOKEN_KEY, _token);
  }

  Future removeToken() async {
    _refreshToken = null;
    _token = null;
    await TPUtils.deleteData(TPDefines.REFRESH_TOKEN_KEY);
    await TPUtils.deleteData(TPDefines.TOKEN_KEY);
  }

  Future<TPResponse> _refreshNewToken() async {
    //RefresherTOKEN

    Map<String, String> headerRequest = {"Authorization" : "Bearer " + _refreshToken};
    TPLogger.log("refresh_token by refresh_token: $headerRequest");
    TPResponse response = await _request.get(TPEndpoints.REFRESHER_TOKEN, headers: headerRequest);
    TPLogger.log('Response refresh_token code: ${response.code}');
    TPLogger.log('Response refresh_token data: ${response.data.toString()}');
    TPLogger.log('Response refresh_token message: ${response.message}');
    if (response.code == TPResponseCode.SUCCESS) {
      await setToken(response.data['token'], response.data['refresh_token']);
    }
    else if (response.code == TPResponseCode.REFRESH_TOKEN_EXPIRED) {
      removeToken();
    }
    return response;
  }

  Future<TPResponse> executeRequest(TPRequestMethod method, String endpoint, {Map<String, String> headers, Map<String, dynamic> data, String filePath}) async {
    Map<String, String> headerRequest = headers == null ? {} : headers;
    if (_token != null)
      headerRequest.addAll({"Authorization" : "Bearer " + _token});
    TPLogger.log('URL: ${_request.baseURL}');
    TPLogger.log('Method: $method');
    TPLogger.log('EndPoint: $endpoint');
    TPLogger.log('Header: ${headerRequest.toString()}');
    TPLogger.log('Body: ${data.toString()}');

    TPResponse tpResponse = TPResponse.systemError();
    switch(method) {
      case TPRequestMethod.GET:
        tpResponse = await _request.get(endpoint, headers: headerRequest);
        break;
      case TPRequestMethod.POST:
        tpResponse = await _request.post(endpoint, data, headers: headerRequest);
        break;
      case TPRequestMethod.PUT:
        tpResponse = await _request.put(endpoint, data, headers: headerRequest);
        break;
      case TPRequestMethod.DELETE:
        tpResponse = await _request.delete(endpoint, data, headers: headerRequest);
        break;
      case TPRequestMethod.PATCH:
        tpResponse = await _request.patch(endpoint, data, headers: headerRequest);
        break;
      case TPRequestMethod.MULTIPART:
        tpResponse = await _request.multipartData(endpoint, data, filePath, headers: headerRequest);
    }

    TPLogger.log('Response code: ${tpResponse.code}');
    TPLogger.log('Response data: ${tpResponse.data.toString()}');
    TPLogger.log('Response message: ${tpResponse.message}');

    //Handle response
    if (endpoint != TPEndpoints.LOGOUT) {
      if (tpResponse.code == TPResponseCode.API_TOKEN_EXPIRED) {//Try to refresh Token
        TPResponse refreshResponse = await _refreshNewToken();
        if (refreshResponse.code == TPResponseCode.SUCCESS) {
          TPLogger.log("refresh token success");
          headerRequest["Authorization"] = "Bearer " + _token;
          tpResponse = await executeRequest(method, endpoint, headers: headerRequest, data: data);
        }
        else if (refreshResponse.code == TPResponseCode.REFRESH_TOKEN_EXPIRED) {
          //notify logout observer
          TPLogger.log("refresh token expire");
          _logoutObserver.addEvent(true);
          tpResponse = refreshResponse;
        }
      }
    }

    return tpResponse;
  }
}