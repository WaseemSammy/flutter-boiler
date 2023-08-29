class OrgSettingResponse {
  List<Data>? data;
  Null? filter;
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Filter'] = this.filter;
    if (this.message != null) {
      data['Message'] = this.message!.toJson();
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['RecordId'] = this.recordId;
    data['ParamGroup'] = this.paramGroup;
    data['ParamName'] = this.paramName;
    data['ParamValue'] = this.paramValue;
    data['Comment'] = this.comment;
    data['IsSecure'] = this.isSecure;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['MessageCode'] = this.messageCode;
    data['MessageType'] = this.messageType;
    data['Message'] = this.message;
    data['MessageSource'] = this.messageSource;
    return data;
  }
}
