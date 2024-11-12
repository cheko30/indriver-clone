import 'dart:convert';

import 'package:indrive_clone_flutter/src/data/api/ApiConfig.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<dynamic> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_URL, '/auth/login');
      Map<String, String> headers = {'Content-type': 'application/json'};
      String body = json.encode({'email': email, 'password': password});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      print('DATA REMOTE: $data');
      return data;
    } catch (e) {
      print('Error: $e');
    }
  }
}
