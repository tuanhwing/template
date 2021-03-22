
import 'package:template/blocs/authentication/tp_authentication_bloc.dart';
import 'package:template/blocs/authentication/tp_authentication_event.dart';
import 'package:template/core/network/tp_endpoints.dart';
import 'package:template/core/network/tp_request.dart';
import 'package:template/core/network/tp_response.dart';

import 'package:template/core/config/tp_app_config.dart';
import 'package:template/core/tp_logger.dart';
import 'package:template/utils/tp_defines.dart';
import 'package:template/utils/tp_utils.dart';

class TPNetworkRequester {
  static final TPNetworkRequester _singleton = TPNetworkRequester._internal();
  factory TPNetworkRequester() {
    return _singleton;
  }
  TPNetworkRequester._internal();

  TPRequest _request = TPRequest(TPAPIConfig[TPAppConfig.APP_ENVIROMENT]);
  TPAuthenticationBloc authenticationBloc;

  String _token;
  String _refreshToken;
  String get token => _token;
  Future<TPResponse> _refreshTokenCompletion;


  Map<String, String> get _defaultHeaders => {
    'Content-Type': 'application/json',
  };

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
    else {
      removeToken();
    }
    return response;
  }

  Future<TPResponse> executeRequest(TPRequestMethod method, String endpoint, {Map<String, String> headers, Map<String, dynamic> data, String filePath}) async {
    ///Wait for refresh_token complete before request network
    await _refreshTokenCompletion;

    Map<String, String> headerRequest = Map.from(_defaultHeaders);
    if (headers != null) {
      headerRequest.addAll(headers);
    }
    if (_token != null) {
      headerRequest.addAll({"Authorization": "Bearer " + _token});
    }
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
        _refreshTokenCompletion =  _refreshNewToken();

        TPResponse refreshResponse = await _refreshTokenCompletion;
        if (refreshResponse.code == TPResponseCode.SUCCESS) {
          TPLogger.log("refresh token success");
          headerRequest["Authorization"] = "Bearer " + _token;
          tpResponse = await executeRequest(method, endpoint, headers: headerRequest, data: data);
        }
        else if (refreshResponse.code == TPResponseCode.REFRESH_TOKEN_EXPIRED) {
          //notify logout observer
          TPLogger.log("refresh token expire");
          authenticationBloc.add(TPAuthenticationTokenExpired());
          tpResponse = refreshResponse;
        }

      }
    }

    return tpResponse;
  }
}