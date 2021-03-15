
import 'package:flutter/cupertino.dart';
import 'package:template/core/tp_logger.dart';

// RESPONSE JSON:
// {
//    code: 0
//    data: {....}
//    message: "message"
// }

class TPResponseCode {
  //[START]Server error
  static const int SUCCESS = 0;
  static const int API_TOKEN_EXPIRED = 6;
  static const int REFRESH_TOKEN_EXPIRED = 9;
  static const int SYSTEM_ERROR = 10;
//[START]Server error
}

class TPResponse {
  int code;
  String message;
  dynamic data;

  TPResponse({@required this.code, this.message, this.data});

  factory TPResponse.fromJson(Map<String, dynamic> json) {
    TPLogger.log('json response $json');
    if (json == null) return TPResponse.systemError();
    try {
      if (json['code'] == null) throw("json response format incorrect!");
      return TPResponse(
        code: json['code'] as int,
        data: json['data'],
        message: json['message'],
      );
    }
    catch (exception) {
      TPLogger.log('QTCResponse parse: ' + exception.toString());
      return TPResponse.systemError(message: exception.toString());
    }
  }

  factory TPResponse.systemError({String message}) {
    return TPResponse(code: TPResponseCode.SYSTEM_ERROR, message: message);
  }
}