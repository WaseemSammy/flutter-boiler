class LoginModelResponse {
  Data? data;
  Null? filter;
  Message? message;

  LoginModelResponse({this.data, this.filter, this.message});

  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    filter = json['Filter'];
    message =
    json['Message'] != null ? new Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Filter'] = this.filter;
    if (this.message != null) {
      data['Message'] = this.message!.toJson();
    }
    return data;
  }
}

class Data {
  String? userName;
  int? countryId;
  Null? login;
  Null? picture;
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
  Null? functionalProfiles;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['CountryId'] = this.countryId;
    data['Login'] = this.login;
    data['Picture'] = this.picture;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['SystemType'] = this.systemType;
    data['DisplayName'] = this.displayName;
    data['UserAgent'] = this.userAgent;
    data['TwoFactorAuth'] = this.twoFactorAuth;
    data['IsWorkflowCompleted'] = this.isWorkflowCompleted;
    data['AccountId'] = this.accountId;
    data['TmpClientId'] = this.tmpClientId;
    data['PortfolioId'] = this.portfolioId;
    data['FunctionalProfiles'] = this.functionalProfiles;
    data['UserId'] = this.userId;
    data['OrgId'] = this.orgId;
    data['LanguageId'] = this.languageId;
    data['Token'] = this.token;
    data['ExpiresOn'] = this.expiresOn;
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
