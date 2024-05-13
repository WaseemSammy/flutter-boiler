
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Common shared preference helper class
class SharedPreferencesHelper {
  static const String _authToken = "authToken";
  static const String _customURL = "customURL";

  static Future<FlutterSecureStorage> get _instance async => prefs ??= const FlutterSecureStorage();
  static FlutterSecureStorage? prefs;



  static Future<String?> getAuthToken() async {
     prefs = await _instance;
    return await prefs?.read(key: _authToken);
  }

  //Returns empty String if token is not set

  static Future<void> setAuthToken(String value) async {
     prefs = await _instance;
    return prefs?.write(key : _authToken,value: value);
  }

  static Future<void> clearAuthToken() async {
    prefs = await _instance;
    return prefs?.delete(key:_authToken);
  }


  static Future<void> saveValue(String key,String value) async{
    prefs = await _instance;
    return prefs?.write(key:key, value: value);
  }

  static Future<String?> getValue(String key) async{
    prefs = await _instance;
    return await prefs?.read(key:key);
  }

  static Future<String?> getStringValue(String key) async {
    String? value = await getValue(key);
    return value;
  }

}
