import 'dart:io';
import 'package:wikipedia/utiles/utility.dart';

import '../app_constant/constant.dart';
import '../api_base_helper/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ApiBaseHelper {
  final String _baseUrl = Constant.baseUrl + Constant.queryURL;
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url, headers: {
        'Accept': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.post(_baseUrl + url, body: body, headers: {
        'Accept': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.put(_baseUrl + url, body: body, headers: {
        'Accept': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await http.delete(_baseUrl + url, headers: {
        'Accept': 'application/json',
      });
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      Utility.createFileAndCache(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
