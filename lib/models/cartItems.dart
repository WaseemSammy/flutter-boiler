class CartItems {
  List<CartItemData>? data;

  CartItems({this.data});

  CartItems.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CartItemData>[];
      json['data'].forEach((v) {
        data!.add(CartItemData.fromJson(v));
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

class CartItemData {
  int? tableId;
  String? tableName;
  List<Orders>? orders = [];

  CartItemData({this.tableId, this.tableName, this.orders});

  CartItemData.fromJson(Map<String, dynamic> json) {
    tableId = json['tableId'];
    tableName = json['tableName'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }else{
      orders = <Orders>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tableId'] = tableId;
    data['tableName'] = tableName;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? itemId;
  int? quantity;
  String? itemName;
  String? itemDescription;
  int? itemType;
  double? itemPrice;
  int? count = 0;

  Orders(
      {this.itemId,
        this.quantity,
        this.itemName,
        this.itemDescription,
        this.itemType,
        this.itemPrice,
        this.count});

  Orders.clone(Orders? mydata) : this(itemId: mydata?.itemId,quantity : mydata?.quantity,itemName: mydata?.itemName,itemDescription: mydata?.itemDescription,itemType: mydata?.itemType,itemPrice: mydata?.itemPrice,count: mydata?.count);

  Orders.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    quantity = json['quantity'];
    itemName = json['itemName'];
    itemDescription = json['itemDescription'];
    itemType = json['itemType'];
    itemPrice = json['itemPrice'];
    count = json['count']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemId'] = itemId;
    data['quantity'] = quantity;
    data['itemName'] = itemName;
    data['itemDescription'] = itemDescription;
    data['itemType'] = itemType;
    data['itemPrice'] = itemPrice;
    data['count'] = count;
    return data;
  }
}