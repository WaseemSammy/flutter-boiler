///Application related constants are set here

class AppConstants {


  static const String Clients = 'Clients';
  static const String Consolidations = 'Consolidations';
  static const String Markets = 'Markets';
  static const String Portfolios = 'Portfolios';
  static const String APP_NAME = 'Flutter Boiler Plate';
   static const String KEY_ISSERVER_CONFIGURED = "KEY_ISSERVER_CONFIGURED";
   static const String KEY_APPSETTINGS = "KEY_APPSETTINGS";
   static const String KEY_ORGSETTING_PREF = "KEY_ORGSETTING_PREF";
   static const String KEY_MARKETMAP_SETTINGS = "KEY_MARKETMAP_SETTINGS";
   static const String KEY_ORGANISATION_LIST = "KEY_ORGANISATION_LIST";
   static const String KEY_ORGANISATION_MAP = "KEY_ORGANISATION_MAP";
   static const String KEY_SELECTED_LAST_INDEX = "KEY_SELECTED_LAST_INDEX";
   static const String KEY_SERVER_URL = "KEY_SERVER_URL";
   static const String KEY_DEVICE_ID = "KEY_DEVICE_ID";

  //Allows Developers to test on custom base URL by showing an custom URL screen at start up.
  //Application have Safe checks in main.dart so custom URL page will never show if isProdBuild flag in AppConstants is set as true.
  static const bool isCustomURLBuild = true;

  //Flutter level flag
  //Will set base URL to Production if set true.
  static const bool isProdBuild = false;

  static const Map<String, String> Countries = {
    "India": "in",
    "United States of America": "us",
  };
}

//API status enums
enum ApiStatus { idle, started, completed, loading, searching, empty, failed, timeout }
