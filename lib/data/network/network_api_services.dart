import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception("Data not found or invalid city name");
      } else if (response.statusCode == 401) {
        throw Exception("Invalid Api Key");
      } else if (response.statusCode == 500) {
        throw Exception("Server error");
      } else {
        throw Exception("Something went wrong");
      }
    } on SocketException {
      throw Exception("Internet not available");
    } on TimeoutException {
      throw Exception("Request timeout");
    }
  }
}
