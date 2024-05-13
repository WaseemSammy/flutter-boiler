class DashboardResponse {
  final bool? success;
  final String? message;
  final int? statusCode;
  final dynamic remarks;
  final String? traceId;
  final dynamic errors;
  final Data? data;

  DashboardResponse({
    this.success,
    this.message,
    this.statusCode,
    this.remarks,
    this.traceId,
    this.errors,
    this.data,
  });

  DashboardResponse.fromJson(Map<String, dynamic> json)
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
  final List<OrderStatus>? orderStatus;
  final int? allTableCount;
  final int? runningTableCount;
  final List<CurrentOrders>? currentOrders;
  final List<Areas>? areas;

  Data({
    this.orderStatus,
    this.allTableCount,
    this.runningTableCount,
    this.currentOrders,
    this.areas,
  });

  Data.fromJson(Map<String, dynamic> json)
      : orderStatus = (json['orderStatus'] as List?)?.map((dynamic e) => OrderStatus.fromJson(e as Map<String,dynamic>)).toList(),
        allTableCount = json['allTableCount'] as int?,
        runningTableCount = json['runningTableCount'] as int?,
        currentOrders = (json['currentOrders'] as List?)?.map((dynamic e) => CurrentOrders.fromJson(e as Map<String,dynamic>)).toList(),
        areas = (json['areas'] as List?)?.map((dynamic e) => Areas.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'orderStatus' : orderStatus?.map((e) => e.toJson()).toList(),
    'allTableCount' : allTableCount,
    'runningTableCount' : runningTableCount,
    'currentOrders' : currentOrders?.map((e) => e.toJson()).toList(),
    'areas' : areas?.map((e) => e.toJson()).toList()
  };
}

class OrderStatus {
  final int? id;
  final String? name;
  final int? currentCount;

  OrderStatus({
    this.id,
    this.name,
    this.currentCount,
  });

  OrderStatus.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        currentCount = json['currentCount'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'currentCount' : currentCount
  };
}

class CurrentOrders {
  final String? restaurantArea;
  final int? restaurantAreaId;
  final List<Orders>? orders;

  CurrentOrders({
    this.restaurantArea,
    this.restaurantAreaId,
    this.orders,
  });

  CurrentOrders.fromJson(Map<String, dynamic> json)
      : restaurantArea = json['restaurantArea'] as String?,
        restaurantAreaId = json['restaurantAreaId'] as int?,
        orders = (json['orders'] as List?)?.map((dynamic e) => Orders.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'restaurantArea' : restaurantArea,
    'restaurantAreaId' : restaurantAreaId,
    'orders' : orders?.map((e) => e.toJson()).toList()
  };
}

class Orders {
  final String? restaurantArea;
  final int? restaurantAreaId;
  final int? dininTableId;
  final String? diningTableName;
  final int? orderId;
  final String? startedAtUTC;
  final String? startedAt;
  final int? itemCount;
  final int? orderStatusId;
  final String? orderStatusName;
  final int? assignedTo;
  final String? assignedToName;

  Orders({
    this.restaurantArea,
    this.restaurantAreaId,
    this.dininTableId,
    this.diningTableName,
    this.orderId,
    this.startedAtUTC,
    this.startedAt,
    this.itemCount,
    this.orderStatusId,
    this.orderStatusName,
    this.assignedTo,
    this.assignedToName,
  });

  Orders.fromJson(Map<String, dynamic> json)
      : restaurantArea = json['restaurantArea'] as String?,
        restaurantAreaId = json['restaurantAreaId'] as int?,
        dininTableId = json['dininTableId'] as int?,
        diningTableName = json['diningTableName'] as String?,
        orderId = json['orderId'] as int?,
        startedAtUTC = json['startedAtUTC'] as String?,
        startedAt = json['startedAt'] as String?,
        itemCount = json['itemCount'] as int?,
        orderStatusId = json['orderStatusId'] as int?,
        orderStatusName = json['orderStatusName'] as String?,
        assignedTo = json['assignedTo'] as int?,
        assignedToName = json['assignedToName'] as String?;

  Map<String, dynamic> toJson() => {
    'restaurantArea' : restaurantArea,
    'restaurantAreaId' : restaurantAreaId,
    'dininTableId' : dininTableId,
    'diningTableName' : diningTableName,
    'orderId' : orderId,
    'startedAtUTC' : startedAtUTC,
    'startedAt' : startedAt,
    'itemCount' : itemCount,
    'orderStatusId' : orderStatusId,
    'orderStatusName' : orderStatusName,
    'assignedTo' : assignedTo,
    'assignedToName' : assignedToName
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