class UserViewPrefrences {
  List<UserPrefData>? data;
  Null? filter;
  Message? message;

  UserViewPrefrences({this.data, this.filter, this.message});

  UserViewPrefrences.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <UserPrefData>[];
      json['Data'].forEach((v) {
        data!.add(new UserPrefData.fromJson(v));
      });
    }
    filter = json['Filter'];
    message =
    json['Message'] != null ? new Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class UserPrefData {
  int? recordId;
  int? userId;
  int? gridId;
  int? listId;
  int? objectTypeId;
  int? viewModeId;
  String? sortAttribute;
  String? sortDirection;
  bool? activeFlag;
  int? createUser;
  String? createUserName;
  int? updateUser;
  String? updateUserName;
  String? createTime;
  String? updateTime;
  String? extBusinessKey;

  UserPrefData(
      {this.recordId,
        this.userId,
        this.gridId,
        this.listId,
        this.objectTypeId,
        this.viewModeId,
        this.sortAttribute,
        this.sortDirection,
        this.activeFlag,
        this.createUser,
        this.createUserName,
        this.updateUser,
        this.updateUserName,
        this.createTime,
        this.updateTime,
        this.extBusinessKey});

  UserPrefData.fromJson(Map<String, dynamic> json) {
    recordId = json['RecordId'];
    userId = json['UserId'];
    gridId = json['GridId'];
    listId = json['ListId'];
    objectTypeId = json['ObjectTypeId'];
    viewModeId = json['ViewModeId'];
    sortAttribute = json['SortAttribute'];
    sortDirection = json['SortDirection'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RecordId'] = this.recordId;
    data['UserId'] = this.userId;
    data['GridId'] = this.gridId;
    data['ListId'] = this.listId;
    data['ObjectTypeId'] = this.objectTypeId;
    data['ViewModeId'] = this.viewModeId;
    data['SortAttribute'] = this.sortAttribute;
    data['SortDirection'] = this.sortDirection;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageCode'] = this.messageCode;
    data['MessageType'] = this.messageType;
    data['Message'] = this.message;
    data['MessageSource'] = this.messageSource;
    return data;
  }
}