import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  Future<void> save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return json.decode(prefs.getString(key)!);
    }

    return null;
  }

  Future<dynamic> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<dynamic> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
