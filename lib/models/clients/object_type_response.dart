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
    json['Filter'] != null ? Filter.fromJson(json['Filter']) : null;
    message =
    json['Message'] != null ? Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (filter != null) {
      data['Filter'] = filter!.toJson();
    }
    if (message != null) {
      data['Message'] = message!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ListId'] = listId;
    data['ListName'] = listName;
    data['ListDesc'] = listDesc;
    data['ListPicture'] = listPicture;
    data['ListTypeId'] = listTypeId;
    data['ObjectTypeId'] = objectTypeId;
    data['ShareId'] = shareId;
    data['UserId'] = userId;
    data['MenuItemId'] = menuItemId;
    data['SelectAll'] = selectAll;
    data['HasSearchText'] = hasSearchText;
    data['CountryId'] = countryId;
    data['IsRecommneded'] = isRecommneded;
    data['IsSubscribed'] = isSubscribed;
    data['ListOrder'] = listOrder;
    data['OwnerUserId'] = ownerUserId;
    data['ListType'] = listType;
    data['ObjectDesc'] = objectDesc;
    data['ShareType'] = shareType;
    data['CountryDesc'] = countryDesc;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['MenuItemDesc'] = menuItemDesc;
    data['IsDefault'] = isDefault;
    data['InstrumentTypeId'] = instrumentTypeId;
    data['IsBlacklist'] = isBlacklist;
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

class Filter {
  Page? page;
  dynamic searchText;

  Filter({this.page, this.searchText});

  Filter.fromJson(Map<String, dynamic> json) {
    page = json['Page'] != null ? Page.fromJson(json['Page']) : null;
    searchText = json['SearchText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (page != null) {
      data['Page'] = page!.toJson();
    }
    data['SearchText'] = searchText;
    return data;
  }
}

class Page {
  int? pageSize;
  int? pageIndex;
  int? totalRecords;
  int? sortOrder;
  dynamic orderBy;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PageSize'] = pageSize;
    data['PageIndex'] = pageIndex;
    data['TotalRecords'] = totalRecords;
    data['SortOrder'] = sortOrder;
    data['OrderBy'] = orderBy;
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