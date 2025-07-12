import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indrive_clone_flutter/src/data/api/ApiConfig.dart';
import 'package:indrive_clone_flutter/src/domain/models/DriverPosition.dart';
import 'package:indrive_clone_flutter/src/domain/utils/ListToString.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';

class DriversPositionService {
  Future<Resource<bool>> create(DriverPosition driverPosiion) async {
    try {
      Uri url = Uri.http(ApiConfig.API_URL, '/drivers-position');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode(driverPosiion);
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        print('Error creating driver position: ${data['message']}');
        return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      print('Error creating driver position: $e');
      return ErrorData(e.toString());
    }
  }

  Future<Resource<bool>> delete(int idDriver) async {
    try {
      Uri url = Uri.http(ApiConfig.API_URL, '/drivers-position/${idDriver}');
      Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await http.delete(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        print('Error creating driver position: ${data['message']}');
        return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      print('Error creating driver position: $e');
      return ErrorData(e.toString());
    }
  }
}
