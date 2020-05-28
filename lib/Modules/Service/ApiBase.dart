import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:notes_rea/Modules/Constants.dart';
import 'package:notes_rea/Modules/Service/ApiResponse.dart';
import 'package:notes_rea/Modules/Service/AppException.dart';

abstract class ApiBase {
  final String url;
  static var filter;
  static var format;
  static var username = 'GNIDA-MOB';
  static var password = 'welcome';

  ApiBase({this.url});
  static var basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  Map headers = {
    'connection' :KeepAlive,
    'Accept':'*/*',
    'Accept-Encoding':'gzip, deflate, br',
    'authorization': basicAuth
  };
  Future<dynamic> get() async {
    try {
      final response = await http.get(url, headers:headers);
      final ApiResponse responseJson = _proceesRequest(response);
      return responseJson;
    } on SocketException {
      FetchDataException("No Internet connections");
    } catch (error) {
      ApiResponse.error(error.toString());
    }
  }
  dynamic _proceesRequest(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
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
  } }   }
class ServiceManager extends ApiBase {
  ServiceManager(serviceUrl) : super(url: Base_server_URL + serviceUrl);
}
