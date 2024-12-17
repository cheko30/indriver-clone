import 'dart:convert';

import 'package:indrive_clone_flutter/src/data/api/ApiConfig.dart';
import 'package:http/http.dart' as http;
import 'package:indrive_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indrive_clone_flutter/src/domain/models/User.dart';
import 'package:indrive_clone_flutter/src/domain/utils/ListToString.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_URL, '/auth/login');
      Map<String, String> headers = {'Content-type': 'application/json'};
      String body = json.encode({'email': email, 'password': password});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);
      } else {
        return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return ErrorData(e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_URL, '/auth/register');
      Map<String, String> headers = {'Content-type': 'application/json'};
      String body = json.encode(user);

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print('DATA REMOTE: ${authResponse.toJson()}');
        print('TOKEN: ${authResponse.token}');
        return Success(authResponse);
      } else {
        return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return ErrorData(e.toString());
    }
  }
}
