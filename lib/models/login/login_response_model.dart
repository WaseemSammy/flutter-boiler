class LoginModelResponse {
  Data? data;
  dynamic filter;
  Message? message;

  LoginModelResponse({this.data, this.filter, this.message});

  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    filter = json['Filter'];
    message =
    json['Message'] != null ? Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Filter'] = filter;
    if (message != null) {
      data['Message'] = message!.toJson();
    }
    return data;
  }
}

class Data {
  String? userName;
  int? countryId;
  dynamic login;
  dynamic picture;
  String? firstName;
  String? lastName;
  int? systemType;
  String? displayName;
  String? userAgent;
  bool? twoFactorAuth;
  bool? isWorkflowCompleted;
  int? accountId;
  int? tmpClientId;
  int? portfolioId;
  dynamic functionalProfiles;
  int? userId;
  int? orgId;
  int? languageId;
  String? token;
  String? expiresOn;

  Data(
      {this.userName,
        this.countryId,
        this.login,
        this.picture,
        this.firstName,
        this.lastName,
        this.systemType,
        this.displayName,
        this.userAgent,
        this.twoFactorAuth,
        this.isWorkflowCompleted,
        this.accountId,
        this.tmpClientId,
        this.portfolioId,
        this.functionalProfiles,
        this.userId,
        this.orgId,
        this.languageId,
        this.token,
        this.expiresOn});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    countryId = json['CountryId'];
    login = json['Login'];
    picture = json['Picture'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    systemType = json['SystemType'];
    displayName = json['DisplayName'];
    userAgent = json['UserAgent'];
    twoFactorAuth = json['TwoFactorAuth'];
    isWorkflowCompleted = json['IsWorkflowCompleted'];
    accountId = json['AccountId'];
    tmpClientId = json['TmpClientId'];
    portfolioId = json['PortfolioId'];
    functionalProfiles = json['FunctionalProfiles'];
    userId = json['UserId'];
    orgId = json['OrgId'];
    languageId = json['LanguageId'];
    token = json['Token'];
    expiresOn = json['ExpiresOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = userName;
    data['CountryId'] = countryId;
    data['Login'] = login;
    data['Picture'] = picture;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['SystemType'] = systemType;
    data['DisplayName'] = displayName;
    data['UserAgent'] = userAgent;
    data['TwoFactorAuth'] = twoFactorAuth;
    data['IsWorkflowCompleted'] = isWorkflowCompleted;
    data['AccountId'] = accountId;
    data['TmpClientId'] = tmpClientId;
    data['PortfolioId'] = portfolioId;
    data['FunctionalProfiles'] = functionalProfiles;
    data['UserId'] = userId;
    data['OrgId'] = orgId;
    data['LanguageId'] = languageId;
    data['Token'] = token;
    data['ExpiresOn'] = expiresOn;
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
