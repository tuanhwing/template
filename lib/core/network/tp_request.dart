


import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:template/core/network/tp_response.dart';
import 'package:http/http.dart' as http;

enum TPRequestMethod {
  GET, POST, PUT, DELETE, PATCH, MULTIPART
}

class TPRequest {
  TPRequest(this._baseURL);
  final String _baseURL;

  String get baseURL => _baseURL;

  static http.Client _httpClient = http.Client();
  static const timeLimit = const Duration(seconds: 30);

  Map<String, String> get _defaultHeaders => {
    'Content-Type': 'application/json',
  };

  Future<TPResponse> get(String endpoint, {Map<String, String> headers = const {}}) async {
    Map<String, dynamic> _headers = _defaultHeaders;
    _headers.addAll(headers);

    try {
      final response =
      await _httpClient.get(_baseURL + endpoint, headers: _headers).timeout(timeLimit);

      return TPResponse.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } on FormatException catch (exception) {
      // A format exception.
      return TPResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return TPResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return TPResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return TPResponse.systemError(message: exception.toString());
    }
  }

  Future<TPResponse> post(String endpoint, dynamic data, {Map<String, String> headers = const {}, Encoding encoding}) async {
    Map<String, dynamic> _headers = _defaultHeaders;
    _headers.addAll(headers);

    try {
      final response = await _httpClient
          .post(_baseURL + endpoint, headers: _headers, body: json.encode(data), encoding: encoding)
          .timeout(timeLimit);
      return TPResponse.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } on FormatException catch (exception) {
      // A format exception.
      return TPResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return TPResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return TPResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return TPResponse.systemError(message: exception.toString());
    }
  }

  Future<TPResponse> put(String endpoint, dynamic data, {Map<String, String> headers = const {}, Encoding encoding}) async {
    Map<String, dynamic> _headers = _defaultHeaders;
    _headers.addAll(headers);

    try {
      final response = await _httpClient
          .put(_baseURL + endpoint, headers: _headers, body: json.encode(data), encoding: encoding)
          .timeout(timeLimit);

      return TPResponse.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } on FormatException catch (exception) {
      // A format exception.
      return TPResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return TPResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return TPResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return TPResponse.systemError(message: exception.toString());
    }
  }

  Future<TPResponse> delete(String endpoint, dynamic data, {Map<String, String> headers = const {}}) async {
    Map<String, dynamic> _headers = _defaultHeaders;
    _headers.addAll(headers);

    try {
      final response =
      await _httpClient.delete(_baseURL + endpoint, headers: _headers).timeout(timeLimit);

      return TPResponse.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } on FormatException catch (exception) {
      // A format exception.
      return TPResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return TPResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return TPResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return TPResponse.systemError(message: exception.toString());
    }
  }

  Future<TPResponse> patch(String endpoint, dynamic data, {Map<String, String> headers = const {}, Encoding encoding}) async {
    Map<String, dynamic> _headers = _defaultHeaders;
    _headers.addAll(headers);

    try {
      final response = await _httpClient
          .patch(_baseURL + endpoint, headers: headers, body: json.encode(data), encoding: encoding)
          .timeout(timeLimit);

      return TPResponse.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } on FormatException catch (exception) {
      // A format exception.
      return TPResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return TPResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return TPResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return TPResponse.systemError(message: exception.toString());
    }
  }

  Future<TPResponse> multipartData(String endpoint, dynamic data, String filePath, {Map<String, String> headers = const {}}) async {
    Map<String, dynamic> _headers = _defaultHeaders;
    _headers.addAll(headers);

    try {
      final request = new http.MultipartRequest("POST", Uri.parse(_baseURL + endpoint));
      final multipartFile = await http.MultipartFile.fromPath(
        'data',
        filePath,
      );
      request.headers.addAll(headers);
      request.files.add(multipartFile);
      final response = await http.Response.fromStream(await request.send());

      return TPResponse.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } on FormatException catch (exception) {
      // A format exception.
      return TPResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return TPResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return TPResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return TPResponse.systemError(message: exception.toString());
    }

    // TPResponse response = await QTCRequestClient.multiPartFile(_baseURL + endpoint, filePath, headers: _headers, body: json.encode(data));
    // return response;
  }

}