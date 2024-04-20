class OrgSettingResponse {
  List<Data>? data;
  dynamic filter;
  Message? message;

  OrgSettingResponse({this.data, this.filter, this.message});

  OrgSettingResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    filter = json['Filter'];
    message =
    json['Message'] != null ?  Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Filter'] = filter;
    if (message != null) {
      data['Message'] = message!.toJson();
    }
    return data;
  }
}

class Data {
  int? recordId;
  String? paramGroup;
  String? paramName;
  String? paramValue;
  String? comment;
  bool? isSecure;
  bool? activeFlag;
  int? createUser;
  String? createUserName;
  int? updateUser;
  String? updateUserName;
  String? createTime;
  String? updateTime;
  String? extBusinessKey;

  Data(
      {this.recordId,
        this.paramGroup,
        this.paramName,
        this.paramValue,
        this.comment,
        this.isSecure,
        this.activeFlag,
        this.createUser,
        this.createUserName,
        this.updateUser,
        this.updateUserName,
        this.createTime,
        this.updateTime,
        this.extBusinessKey});

  Data.fromJson(Map<String, dynamic> json) {
    recordId = json['RecordId'];
    paramGroup = json['ParamGroup'];
    paramName = json['ParamName'];
    paramValue = json['ParamValue'];
    comment = json['Comment'];
    isSecure = json['IsSecure'];
    activeFlag = json['ActiveFlag'];
    createUser = json['CreateUser'];
    createUserName = json['CreateUserName'];
    updateUser = json['UpdateUser'];
    updateUserName = json['UpdateUserName'];
    createTime = json['CreateTime'];
    updateTime = json['UpdateTime'];
    extBusinessKey = json['ExtBusinessKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['RecordId'] = recordId;
    data['ParamGroup'] = paramGroup;
    data['ParamName'] = paramName;
    data['ParamValue'] = paramValue;
    data['Comment'] = comment;
    data['IsSecure'] = isSecure;
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
