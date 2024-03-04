import 'package:my_flutter/models/food_category_response.dart';

import '../models/running_order_response.dart';

class DummyJson{


  static RunningOrders runningOrders = RunningOrders.fromJson({"data":[
    {"tableId":1,"tableNo":1,"tableCapcity":5,"noOfPerson":2,"orders":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"tableId":2,"tableNo":2,"tableCapcity":5,"noOfPerson":2,"orders":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"tableId":3,"tableNo":3,"tableCapcity":5,"noOfPerson":2,"orders":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"tableId":4,"tableNo":4,"tableCapcity":5,"noOfPerson":2,"orders":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"tableId":5,"tableNo":5,"tableCapcity":5,"noOfPerson":2,"orders":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"tableId":6,"tableNo":6,"tableCapcity":5,"noOfPerson":2,"orders":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]}
  ]});

  
  static FoodCatergoryResponse dummyCategory = FoodCatergoryResponse.fromJson({"data":[
    {"categoryId":1,"categoryName":"Starter","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0},{"itemId":3,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0},{"itemId":5,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0},{"itemId":6,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0},{"itemId":7,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0},{"itemId":8,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0},{"itemId":9,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0},{"itemId":10,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":2,"categoryName":"Punjabi","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":3,"categoryName":"Main","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":4,"categoryName":"Pizza","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":5,"categoryName":"Buger","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":6,"categoryName":"Veg","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":7,"categoryName":"Non-Veg","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":8,"categoryName":"Drink","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
    {"categoryId":9,"categoryName":"Desert","menu":[{"itemId":0,"quantity":1,"itemName":"Paneer Tikka","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":1,"quantity":1,"itemName":"Salad","itemDescription":"Spicy with gravy","itemType":0,"itemPrice" : 300.0},{"itemId":2,"quantity":1,"itemName":"Naan","itemDescription":"Naan","itemType":0,"itemPrice" : 300.0}]},
  ]});


  static  RunningOrders allTable = RunningOrders.fromJson({"data":[
    {"tableId":1,"tableNo":1,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":2,"tableNo":2,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":3,"tableNo":3,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":4,"tableNo":4,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":5,"tableNo":5,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":6,"tableNo":6,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":7,"tableNo":7,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":8,"tableNo":8,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":9,"tableNo":9,"tableCapcity":5,"noOfPerson":0,"orders":[]},
    {"tableId":10,"tableNo":10,"tableCapcity":5,"noOfPerson":0,"orders":[]},
  ]});
  

}