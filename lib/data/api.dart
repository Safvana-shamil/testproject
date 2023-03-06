import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../import_packages.dart';

class ApiData {
  static Future<Object> getAllCoursesApi() async {
    var response;
    try {
      response = await http.get(
          Uri.parse("https://mockend.com/Safvana-shamil/cbqtestproject/posts"));
      if (response.statusCode == 200) {
        return Success(
            response: courseModelFromMap(response.body),
            code: response.statusCode);
      }
      return Error(
          code: response.statusCode, errorMessage: 'Invalid Response');
    } on HttpException {
      return Error(
          code: response.statusCode,
          errorMessage: 'No Internet Connection');
    } on SocketException {
      return Error(
          code: response.statusCode, errorMessage: 'No Internet Connection');
    } on FormatException {
      return Error(
          code: response.statusCode, errorMessage  : 'Invalid Format');
    } catch (e) {
      return Error(code: response.statusCode, errorMessage: 'Unknown Error');
    }
  }
}




