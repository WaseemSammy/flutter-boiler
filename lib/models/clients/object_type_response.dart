class ObjectTypeResponse {
  List<ObjectData>? data;
  Filter? filter;
  Message? message;

  ObjectTypeResponse({this.data, this.filter, this.message});

  ObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <ObjectData>[];
      json['Data'].forEach((v) {
        data!.add(ObjectData.fromJson(v));
      });
    }
    filter =
    json['Filter'] != null ? new Filter.fromJson(json['Filter']) : null;
    message =
    json['Message'] != null ? new Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.filter != null) {
      data['Filter'] = this.filter!.toJson();
    }
    if (this.message != null) {
      data['Message'] = this.message!.toJson();
    }
    return data;
  }
}

class ObjectData {
  int? listId;
  String? listName;
  String? listDesc;
  String? listPicture;
  int? listTypeId;
  int? objectTypeId;
  int? shareId;
  int? userId;
  int? menuItemId;
  bool? selectAll;
  bool? hasSearchText;
  int? countryId;
  bool? isRecommneded;
  bool? isSubscribed;
  int? listOrder;
  int? ownerUserId;
  String? listType;
  String? objectDesc;
  String? shareType;
  String? countryDesc;
  String? firstName;
  String? lastName;
  String? menuItemDesc;
  bool? isDefault;
  int? instrumentTypeId;
  bool? isBlacklist;
  bool? activeFlag;
  int? createUser;
  String? createUserName;
  String? updateUser;
  String? updateUserName;
  String? createTime;
  String? updateTime;
  String? extBusinessKey;

  ObjectData(
      {this.listId,
        this.listName,
        this.listDesc,
        this.listPicture,
        this.listTypeId,
        this.objectTypeId,
        this.shareId,
        this.userId,
        this.menuItemId,
        this.selectAll,
        this.hasSearchText,
        this.countryId,
        this.isRecommneded,
        this.isSubscribed,
        this.listOrder,
        this.ownerUserId,
        this.listType,
        this.objectDesc,
        this.shareType,
        this.countryDesc,
        this.firstName,
        this.lastName,
        this.menuItemDesc,
        this.isDefault,
        this.instrumentTypeId,
        this.isBlacklist,
        this.activeFlag,
        this.createUser,
        this.createUserName,
        this.updateUser,
        this.updateUserName,
        this.createTime,
        this.updateTime,
        this.extBusinessKey});

  ObjectData.fromJson(Map<String, dynamic> json) {
    listId = json['ListId'];
    listName = json['ListName'];
    listDesc = json['ListDesc'];
    listPicture = json['ListPicture'];
    listTypeId = json['ListTypeId'];
    objectTypeId = json['ObjectTypeId'];
    shareId = json['ShareId'];
    userId = json['UserId'];
    menuItemId = json['MenuItemId'];
    selectAll = json['SelectAll'];
    hasSearchText = json['HasSearchText'];
    countryId = json['CountryId'];
    isRecommneded = json['IsRecommneded'];
    isSubscribed = json['IsSubscribed'];
    listOrder = json['ListOrder'];
    ownerUserId = json['OwnerUserId'];
    listType = json['ListType'];
    objectDesc = json['ObjectDesc'];
    shareType = json['ShareType'];
    countryDesc = json['CountryDesc'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    menuItemDesc = json['MenuItemDesc'];
    isDefault = json['IsDefault'];
    instrumentTypeId = json['InstrumentTypeId'];
    isBlacklist = json['IsBlacklist'];
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
    data['ListId'] = this.listId;
    data['ListName'] = this.listName;
    data['ListDesc'] = this.listDesc;
    data['ListPicture'] = this.listPicture;
    data['ListTypeId'] = this.listTypeId;
    data['ObjectTypeId'] = this.objectTypeId;
    data['ShareId'] = this.shareId;
    data['UserId'] = this.userId;
    data['MenuItemId'] = this.menuItemId;
    data['SelectAll'] = this.selectAll;
    data['HasSearchText'] = this.hasSearchText;
    data['CountryId'] = this.countryId;
    data['IsRecommneded'] = this.isRecommneded;
    data['IsSubscribed'] = this.isSubscribed;
    data['ListOrder'] = this.listOrder;
    data['OwnerUserId'] = this.ownerUserId;
    data['ListType'] = this.listType;
    data['ObjectDesc'] = this.objectDesc;
    data['ShareType'] = this.shareType;
    data['CountryDesc'] = this.countryDesc;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['MenuItemDesc'] = this.menuItemDesc;
    data['IsDefault'] = this.isDefault;
    data['InstrumentTypeId'] = this.instrumentTypeId;
    data['IsBlacklist'] = this.isBlacklist;
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

class Filter {
  Page? page;
  Null? searchText;

  Filter({this.page, this.searchText});

  Filter.fromJson(Map<String, dynamic> json) {
    page = json['Page'] != null ? new Page.fromJson(json['Page']) : null;
    searchText = json['SearchText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.page != null) {
      data['Page'] = this.page!.toJson();
    }
    data['SearchText'] = this.searchText;
    return data;
  }
}

class Page {
  int? pageSize;
  int? pageIndex;
  int? totalRecords;
  int? sortOrder;
  Null? orderBy;

  Page(
      {this.pageSize,
        this.pageIndex,
        this.totalRecords,
        this.sortOrder,
        this.orderBy});

  Page.fromJson(Map<String, dynamic> json) {
    pageSize = json['PageSize'];
    pageIndex = json['PageIndex'];
    totalRecords = json['TotalRecords'];
    sortOrder = json['SortOrder'];
    orderBy = json['OrderBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PageSize'] = this.pageSize;
    data['PageIndex'] = this.pageIndex;
    data['TotalRecords'] = this.totalRecords;
    data['SortOrder'] = this.sortOrder;
    data['OrderBy'] = this.orderBy;
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