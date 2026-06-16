import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
 static late SharedPreferences sharedPreferences;

//! Here The Initialize of cache .
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

//! this method to put data in local database using key

  String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

//! this method to put data in local database using key

 static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

//! this method to get data already saved in local database

 static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

//! remove data using specific key

 static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
 static Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

//! clear all data in the local database
 static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

//! this method to put data in local database using key
 static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }



  //! حفظ List<Map>
static Future<bool> saveListMap({
  required String key,
  required List<Map<String, dynamic>> value,
}) async {
  return await sharedPreferences.setString(
    key,
    jsonEncode(value),
  );
}

//! جلب List<Map>
static List<Map<String, dynamic>> getListMap({
  required String key,
}) {
  final data = sharedPreferences.getString(key);

  if (data == null) {
    return [];
  }

  return List<Map<String, dynamic>>.from(
    jsonDecode(data),
  );
}
}