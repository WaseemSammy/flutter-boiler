import 'cartItems.dart';

class RunningOrders {
  List<Data>? data;

  RunningOrders({this.data});

  RunningOrders.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? tableId;
  int? tableNo;
  int? tableCapcity;
  int? noOfPerson;
  List<Orders>? orders;

  Data({this.tableId,this.tableNo, this.tableCapcity, this.noOfPerson, this.orders});
  Data.clone(Data? mydata) : this(tableId: mydata?.tableId,tableNo: mydata?.tableNo,tableCapcity: mydata?.noOfPerson,orders: mydata?.orders);

  Data.fromJson(Map<String, dynamic> json) {
    tableId = json['tableId'];
    tableNo = json['tableNo'];
    tableCapcity = json['tableCapcity'];
    noOfPerson = json['noOfPerson'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tableId'] = tableId;
    data['tableNo'] = tableNo;
    data['tableCapcity'] = tableCapcity;
    data['noOfPerson'] = noOfPerson??"";
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

