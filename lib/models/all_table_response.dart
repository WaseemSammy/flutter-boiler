class AllTableResponse {
  final bool? success;
  final String? message;
  final int? statusCode;
  final dynamic remarks;
  final String? traceId;
  final dynamic errors;
  final Data? data;

  AllTableResponse({
    this.success,
    this.message,
    this.statusCode,
    this.remarks,
    this.traceId,
    this.errors,
    this.data,
  });

  AllTableResponse.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        statusCode = json['statusCode'] as int?,
        remarks = json['remarks'],
        traceId = json['traceId'] as String?,
        errors = json['errors'],
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'message' : message,
    'statusCode' : statusCode,
    'remarks' : remarks,
    'traceId' : traceId,
    'errors' : errors,
    'data' : data?.toJson()
  };
}

class Data {
  final List<TableStatus>? tableStatus;
  final List<Areas>? areas;
  final List<Tables>? tables;

  Data({
    this.tableStatus,
    this.areas,
    this.tables,
  });

  Data.fromJson(Map<String, dynamic> json)
      : tableStatus = (json['tableStatus'] as List?)?.map((dynamic e) => TableStatus.fromJson(e as Map<String,dynamic>)).toList(),
        areas = (json['areas'] as List?)?.map((dynamic e) => Areas.fromJson(e as Map<String,dynamic>)).toList(),
        tables = (json['tables'] as List?)?.map((dynamic e) => Tables.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'tableStatus' : tableStatus?.map((e) => e.toJson()).toList(),
    'areas' : areas?.map((e) => e.toJson()).toList(),
    'tables' : tables?.map((e) => e.toJson()).toList()
  };
}

class TableStatus {
  final int? id;
  final String? name;

  TableStatus({
    this.id,
    this.name,
  });

  TableStatus.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name
  };
}

class Areas {
  final String? areaName;
  final int? id;

  Areas({
    this.areaName,
    this.id,
  });

  Areas.fromJson(Map<String, dynamic> json)
      : areaName = json['areaName'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'areaName' : areaName,
    'id' : id
  };
}

class Tables {
  final String? restaurantArea;
  final int? restaurantAreaId;
  final int? dininTableId;
  final String? diningTableName;
  final int? orderId;
  final String? startedAtUTC;
  final String? startedAt;
  final int? itemCount;
  final String? tableStatus;
  final int? tableStatusId;
  final String? orderStatus;
  final int? orderStatusId;
  final int? paxCapacity;
  final int? runningGuest;

  Tables({
    this.restaurantArea,
    this.restaurantAreaId,
    this.dininTableId,
    this.diningTableName,
    this.orderId,
    this.startedAtUTC,
    this.startedAt,
    this.itemCount,
    this.tableStatus,
    this.tableStatusId,
    this.orderStatus,
    this.orderStatusId,
    this.paxCapacity,
    this.runningGuest,
  });

  Tables.fromJson(Map<String, dynamic> json)
      : restaurantArea = json['restaurantArea'] as String?,
        restaurantAreaId = json['restaurantAreaId'] as int?,
        dininTableId = json['dininTableId'] as int?,
        diningTableName = json['diningTableName'] as String?,
        orderId = json['orderId'] as int?,
        startedAtUTC = json['startedAtUTC'] as String?,
        startedAt = json['startedAt'] as String?,
        itemCount = json['itemCount'] as int?,
        tableStatus = json['tableStatus'] as String?,
        tableStatusId = json['tableStatusId'] as int?,
        orderStatus = json['orderStatus'] as String?,
        orderStatusId = json['orderStatusId'] as int?,
        paxCapacity = json['paxCapacity'] as int?,
        runningGuest = json['runningGuest'] as int?;

  Map<String, dynamic> toJson() => {
    'restaurantArea' : restaurantArea,
    'restaurantAreaId' : restaurantAreaId,
    'dininTableId' : dininTableId,
    'diningTableName' : diningTableName,
    'orderId' : orderId,
    'startedAtUTC' : startedAtUTC,
    'startedAt' : startedAt,
    'itemCount' : itemCount,
    'tableStatus' : tableStatus,
    'tableStatusId' : tableStatusId,
    'orderStatus' : orderStatus,
    'orderStatusId' : orderStatusId,
    'paxCapacity' : paxCapacity,
    'runningGuest' : runningGuest
  };
}