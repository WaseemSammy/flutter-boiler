class AppSettingModel {
  Data? data;
  Message? message;

  AppSettingModel({this.data, this.message});

  AppSettingModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;

    message =
    json['Message'] != null ? new Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (this.message != null) {
      data['Message'] = this.message!.toJson();
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
        ? new LoginScreenSetting.fromJson(json['LoginScreenSetting'])
        : null;
    appVersionInfo = json['AppVersionInfo'] != null
        ? new AppVersionInfo.fromJson(json['AppVersionInfo'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrganizationId'] = this.organizationId;
    data['OrganizationName'] = this.organizationName;
    data['OrganizationNameShort'] = this.organizationNameShort;
    data['ScreenLockInterval'] = this.screenLockInterval;
    data['LocalizationModifiedTimestamp'] = this.localizationModifiedTimestamp;
    data['NotificationHubBaseUri'] = this.notificationHubBaseUri;
    if (this.loginScreenSetting != null) {
      data['LoginScreenSetting'] = this.loginScreenSetting!.toJson();
    }
    if (this.appVersionInfo != null) {
      data['AppVersionInfo'] = this.appVersionInfo!.toJson();
    }
    data['ActiveFlag'] = this.activeFlag;
    data['CreateUser'] = this.createUser;
    data['CreateUserName'] = this.createUserName;
    data['UpdateUser'] = this.updateUser;
    data['UpdateUserName'] = this.updateUserName;
    data['CreateTime'] = this.createTime;
    data['UpdateTime'] = this.updateTime;
    data['ExtBusinessKey'] = this.extBusinessKey;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IosSplashLogo'] = this.iosSplashLogo;
    data['IosSplashBackground'] = this.iosSplashBackground;
    data['IosXCoord'] = this.iosXCoord;
    data['IosYCoord'] = this.iosYCoord;
    data['IosLoginBoxWidth'] = this.iosLoginBoxWidth;
    data['IosLoginBoxHeight'] = this.iosLoginBoxHeight;
    data['WinSplashLogo'] = this.winSplashLogo;
    data['WinSplashBackground'] = this.winSplashBackground;
    data['WinXCoord'] = this.winXCoord;
    data['WinYCoord'] = this.winYCoord;
    data['WinLoginBoxWidth'] = this.winLoginBoxWidth;
    data['WinLoginBoxHeight'] = this.winLoginBoxHeight;
    data['MobileSplashLogo'] = this.mobileSplashLogo;
    data['MobileSplashBackground'] = this.mobileSplashBackground;
    data['MobileXCoord'] = this.mobileXCoord;
    data['MobileYCoord'] = this.mobileYCoord;
    data['MobileLoginBoxWidth'] = this.mobileLoginBoxWidth;
    data['MobileLoginBoxHeight'] = this.mobileLoginBoxHeight;
    data['LoginBoxColor'] = this.loginBoxColor;
    data['LoginButtonColor'] = this.loginButtonColor;
    data['LoginButtonText'] = this.loginButtonText;
    data['LoginButtonTextColor'] = this.loginButtonTextColor;
    data['LoginBoxOpacity'] = this.loginBoxOpacity;
    data['MydesqInvalidLogin'] = this.mydesqInvalidLogin;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DatabaseVersion'] = this.databaseVersion;
    data['ApiVersion'] = this.apiVersion;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageCode'] = this.messageCode;
    data['MessageType'] = this.messageType;
    data['Message'] = this.message;
    data['MessageSource'] = this.messageSource;
    return data;
  }
}
