class AppSettingModel {
  Data? data;
  Message? message;

  AppSettingModel({this.data, this.message});

  AppSettingModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;

    message =
    json['Message'] != null ? Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (message != null) {
      data['Message'] = message!.toJson();
    }
    return data;
  }
}

class Data {
  int? organizationId;
  String? organizationName;
  String? organizationNameShort;
  int? screenLockInterval;
  String? localizationModifiedTimestamp;
  String? notificationHubBaseUri;
  LoginScreenSetting? loginScreenSetting;
  AppVersionInfo? appVersionInfo;
  bool? activeFlag;
  int? createUser;
  String? createUserName;
  String? updateUser;
  String? updateUserName;
  String? createTime;
  String? updateTime;
  String? extBusinessKey;

  Data(
      {this.organizationId,
        this.organizationName,
        this.organizationNameShort,
        this.screenLockInterval,
        this.localizationModifiedTimestamp,
        this.notificationHubBaseUri,
        this.loginScreenSetting,
        this.appVersionInfo,
        this.activeFlag,
        this.createUser,
        this.createUserName,
        this.updateUser,
        this.updateUserName,
        this.createTime,
        this.updateTime,
        this.extBusinessKey});

  Data.fromJson(Map<String, dynamic> json) {
    organizationId = json['OrganizationId'] as int?;
    organizationName = json['OrganizationName'] as String?;
    organizationNameShort = json['OrganizationNameShort'] as String?;
    screenLockInterval = json['ScreenLockInterval'] as int?;
    localizationModifiedTimestamp = json['LocalizationModifiedTimestamp'] as String?;
    notificationHubBaseUri = json['NotificationHubBaseUri'] as String?;
    loginScreenSetting = json['LoginScreenSetting'] != null
        ? LoginScreenSetting.fromJson(json['LoginScreenSetting'])
        : null;
    appVersionInfo = json['AppVersionInfo'] != null
        ? AppVersionInfo.fromJson(json['AppVersionInfo'])
        : null;
    activeFlag = json['ActiveFlag'] as bool?;
    createUser = json['CreateUser'] as int?;
    createUserName = json['CreateUserName'] as String?;
    updateUser = json['UpdateUser'] as String?;
    updateUserName = json['UpdateUserName'] as String?;
    createTime = json['CreateTime'] as String?;
    updateTime = json['UpdateTime'] as String?;
    extBusinessKey = json['ExtBusinessKey'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OrganizationId'] = organizationId;
    data['OrganizationName'] = organizationName;
    data['OrganizationNameShort'] = organizationNameShort;
    data['ScreenLockInterval'] = screenLockInterval;
    data['LocalizationModifiedTimestamp'] = localizationModifiedTimestamp;
    data['NotificationHubBaseUri'] = notificationHubBaseUri;
    if (loginScreenSetting != null) {
      data['LoginScreenSetting'] = loginScreenSetting!.toJson();
    }
    if (appVersionInfo != null) {
      data['AppVersionInfo'] = appVersionInfo!.toJson();
    }
    data['ActiveFlag'] = activeFlag;
    data['CreateUser'] = createUser;
    data['CreateUserName'] = createUserName;
    data['UpdateUser'] = updateUser;
    data['UpdateUserName'] = updateUserName;
    data['CreateTime'] = createTime;
    data['UpdateTime'] = updateTime;
    data['ExtBusinessKey'] = extBusinessKey;
    return data;
  }
}

class LoginScreenSetting {
  String? iosSplashLogo;
  String? iosSplashBackground;
  int? iosXCoord;
  int? iosYCoord;
  int? iosLoginBoxWidth;
  int? iosLoginBoxHeight;
  String? winSplashLogo;
  String? winSplashBackground;
  int? winXCoord;
  int? winYCoord;
  int? winLoginBoxWidth;
  int? winLoginBoxHeight;
  String? mobileSplashLogo;
  String? mobileSplashBackground;
  int? mobileXCoord;
  int? mobileYCoord;
  int? mobileLoginBoxWidth;
  int? mobileLoginBoxHeight;
  String? loginBoxColor;
  String? loginButtonColor;
  String? loginButtonText;
  String? loginButtonTextColor;
  int? loginBoxOpacity;
  int? mydesqInvalidLogin;

  LoginScreenSetting(
      {this.iosSplashLogo,
        this.iosSplashBackground,
        this.iosXCoord,
        this.iosYCoord,
        this.iosLoginBoxWidth,
        this.iosLoginBoxHeight,
        this.winSplashLogo,
        this.winSplashBackground,
        this.winXCoord,
        this.winYCoord,
        this.winLoginBoxWidth,
        this.winLoginBoxHeight,
        this.mobileSplashLogo,
        this.mobileSplashBackground,
        this.mobileXCoord,
        this.mobileYCoord,
        this.mobileLoginBoxWidth,
        this.mobileLoginBoxHeight,
        this.loginBoxColor,
        this.loginButtonColor,
        this.loginButtonText,
        this.loginButtonTextColor,
        this.loginBoxOpacity,
        this.mydesqInvalidLogin});

  LoginScreenSetting.fromJson(Map<String, dynamic> json) {
    iosSplashLogo = json['IosSplashLogo'] as String?;
    iosSplashBackground = json['IosSplashBackground'] as String?;
    iosXCoord = json['IosXCoord'] as int?;
    iosYCoord = json['IosYCoord'] as int?;
    iosLoginBoxWidth = json['IosLoginBoxWidth'] as int?;
    iosLoginBoxHeight = json['IosLoginBoxHeight'] as int?;
    winSplashLogo = json['WinSplashLogo'] as String?;
    winSplashBackground = json['WinSplashBackground'] as String?;
    winXCoord = json['WinXCoord'] as int?;
    winYCoord = json['WinYCoord'] as int?;
    winLoginBoxWidth = json['WinLoginBoxWidth'] as int?;
    winLoginBoxHeight = json['WinLoginBoxHeight'] as int?;
    mobileSplashLogo = json['MobileSplashLogo'] as String?;
    mobileSplashBackground = json['MobileSplashBackground'] as String?;
    mobileXCoord = json['MobileXCoord'] as int?;
    mobileYCoord = json['MobileYCoord'] as int?;
    mobileLoginBoxWidth = json['MobileLoginBoxWidth'] as int?;
    mobileLoginBoxHeight = json['MobileLoginBoxHeight'] as int?;
    loginBoxColor = json['LoginBoxColor'] as String?;
    loginButtonColor = json['LoginButtonColor'] as String?;
    loginButtonText = json['LoginButtonText'] as String?;
    loginButtonTextColor = json['LoginButtonTextColor'] as String?;
    loginBoxOpacity = json['LoginBoxOpacity'] as int?;
    mydesqInvalidLogin = json['MydesqInvalidLogin'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IosSplashLogo'] = iosSplashLogo;
    data['IosSplashBackground'] = iosSplashBackground;
    data['IosXCoord'] = iosXCoord;
    data['IosYCoord'] = iosYCoord;
    data['IosLoginBoxWidth'] = iosLoginBoxWidth;
    data['IosLoginBoxHeight'] = iosLoginBoxHeight;
    data['WinSplashLogo'] = winSplashLogo;
    data['WinSplashBackground'] = winSplashBackground;
    data['WinXCoord'] = winXCoord;
    data['WinYCoord'] = winYCoord;
    data['WinLoginBoxWidth'] = winLoginBoxWidth;
    data['WinLoginBoxHeight'] = winLoginBoxHeight;
    data['MobileSplashLogo'] = mobileSplashLogo;
    data['MobileSplashBackground'] = mobileSplashBackground;
    data['MobileXCoord'] = mobileXCoord;
    data['MobileYCoord'] = mobileYCoord;
    data['MobileLoginBoxWidth'] = mobileLoginBoxWidth;
    data['MobileLoginBoxHeight'] = mobileLoginBoxHeight;
    data['LoginBoxColor'] = loginBoxColor;
    data['LoginButtonColor'] = loginButtonColor;
    data['LoginButtonText'] = loginButtonText;
    data['LoginButtonTextColor'] = loginButtonTextColor;
    data['LoginBoxOpacity'] = loginBoxOpacity;
    data['MydesqInvalidLogin'] = mydesqInvalidLogin;
    return data;
  }
}

class AppVersionInfo {
  String? databaseVersion;
  String? apiVersion;

  AppVersionInfo({this.databaseVersion, this.apiVersion});

  AppVersionInfo.fromJson(Map<String, dynamic> json) {
    databaseVersion = json['DatabaseVersion'];
    apiVersion = json['ApiVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DatabaseVersion'] = databaseVersion;
    data['ApiVersion'] = apiVersion;
    return data;
  }
}

class Message {
  int? messageCode;
  int? messageType;
  String? message;
  String? messageSource;

  Message(
      {this.messageCode, this.messageType, this.message, this.messageSource});

  Message.fromJson(Map<String, dynamic> json) {
    messageCode = json['MessageCode'];
    messageType = json['MessageType'];
    message = json['Message'];
    messageSource = json['MessageSource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MessageCode'] = messageCode;
    data['MessageType'] = messageType;
    data['Message'] = message;
    data['MessageSource'] = messageSource;
    return data;
  }
}
