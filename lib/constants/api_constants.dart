




import 'package:my_flutter/constants/singleton_constant.dart';

import 'app_constants.dart';

///Api Paths are set here
class ApiConstants {
  //Check if build is production or staging and use url accordingly      PRODUCTION     :     STAGING
  static const String SERVER_BASE_URL = AppConstants.isProdBuild ? "https://dev.mydesq.com/MydesqApi.NextRelease/" : "https://dev.mydesq.com/MydesqApi.NextRelease/";

  ///NOTE: DO NOT TWEAK
  ///Assigning Application's base url which app is going to use. Can use URL from custom page or from SERVER_BASE_URL.
  ///Application have Safe checks so custom URL page will never show if isProdBuild flag in AppConstants is set as true
  static String? appBaseURL =
      AppConstants.isCustomURLBuild && !AppConstants.isProdBuild ? SingletonConstants().getBaseUrl() : SERVER_BASE_URL;

  //Login end point
  //For new end points always start with "/".
  static const String LOGIN = "/api/Auth/Authenticate";
  static const String FLIGHT_LIST = "/api/unknown";
  static const String NEW_APP_SERVER_URL = "/api/AppSettings";
  static const String ORF_SETTINGS = "/api/AppSettings/OrgSettings/Reporting";
  static const String IMAGE_BACKGROUND_URL = "/api/Files/OrganizationFile?filePath=Images/AppBackgrounds/";
  static const String IMAGE_APP_LOGO_URL = "/api/Files/OrganizationFile?filePath=Images/AppLogos/";
  static const String DEFAULT_TREE_ID = "/api/AppSettings/OrgSetting/default_tree_id";
  static const String NOTIFICATION_TOKEN_URL = "/api/Users/NotificationToken";
  static const String CLIENT_BYLIST = "/api/Clients/ClientsByList/";
  static const String OBJECT_TYPE_URL = "/api/Lists/ObjectTypeList/";
  static const String  USER_VIEW_PREFERENCE = "/api/AppSettings/UserViewPreferences?objectTypeId=3";
  static const  int CLIENT_TYPE = 3;

}

///NOTE: DO NOT TWEAK
///Getter to fetch baseURL easily.
///This will be available anywhere on APP level.
String? get baseURL => ApiConstants.appBaseURL;
