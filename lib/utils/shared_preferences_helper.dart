import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Common shared preference helper class
class SharedPreferencesHelper {
  static final String _authToken = "authToken";
  static final String _customURL = "customURL";

  static Future<SharedPreferences> get _instance async => prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? prefs;



  static Future<String?> getAuthToken() async {
     prefs = await _instance;
    return prefs?.getString(_authToken);
  }

  //Returns empty String if token is not set
  static Future<String> getAuthTokenWithNullCheck() async {
     prefs = await _instance;
    return prefs?.getString(_authToken) ?? "";
  }

  static Future<Future<bool>?> setAuthToken(String value) async {
     prefs = await _instance;
    return prefs?.setString(_authToken, value);
  }

  static Future<Future<bool>?> clearAuthToken() async {
    prefs = await _instance;
    return prefs?.remove(_authToken);
  }



  static Future<bool?> saveValue(String key,String value) async{
    prefs = await _instance;
    return prefs?.setString(key, value);
  }
  static Future<bool?> saveBooleanValue(String key,bool value) async{
    prefs = await _instance;
    return prefs?.setBool(key, value);
  }
  static Future<bool?> saveIntValue(String key,int value) async{
    prefs = await _instance;
    return prefs?.setInt(key, value);
  }

  static Future<int?> getIntValue(String key) async{
    prefs = await _instance;
    return prefs?.getInt(key);
  }

  static Future<String?> getValue(String key) async {
    prefs = await _instance;
    return prefs?.getString(key);
  }
  static Future<Map<String, dynamic>?> getMap(String key) async {
    prefs = await _instance;
    String? data = prefs?.getString(key);
    if(data!=null){
     Map<String,dynamic> map = jsonDecode(data);
     return map;
    }else{
      return <String,String>{};
    }
  }

  static  Future<bool?> setMap(String key,String value) async {
    prefs = await _instance;
     return  prefs?.setString(key, value);
  }
}
