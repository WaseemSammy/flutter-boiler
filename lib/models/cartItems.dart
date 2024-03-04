class CartItems {
  List<CartItemData>? data;

  CartItems({this.data});

  CartItems.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CartItemData>[];
      json['data'].forEach((v) {
        data!.add(new CartItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
        orders!.add(new Orders.fromJson(v));
      });
    }else{
      orders = <Orders>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tableId'] = this.tableId;
    data['tableName'] = this.tableName;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['quantity'] = this.quantity;
    data['itemName'] = this.itemName;
    data['itemDescription'] = this.itemDescription;
    data['itemType'] = this.itemType;
    data['itemPrice'] = this.itemPrice;
    data['count'] = this.count;
    return data;
  }
}