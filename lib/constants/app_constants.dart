///Application related constants are set here

class AppConstants {


  static const String Clients = 'Clients';
  static const String Consolidations = 'Consolidations';
  static const String Markets = 'Markets';
  static const String Portfolios = 'Portfolios';
  static const String APP_NAME = 'Flutter Boiler Plate';
  static const String KEY_AREA = "KEY_AREA";

   static const String KEY_DEVICE_ID = "KEY_DEVICE_ID";

  //Allows Developers to test on custom base URL by showing an custom URL screen at start up.
  //Application have Safe checks in main.dart so custom URL page will never show if isProdBuild flag in AppConstants is set as true.
  static const bool isCustomURLBuild = true;

  //Flutter level flag
  //Will set base URL to Production if set true.
  static const bool isProdBuild = false;

  static const Map<String, String> Countries = {
    "India": "in",
    "United States of America": "us",
  };
  static const Map<String, Object?> dummyNewOrder = {
    "success": true,
    "message": "Success",
    "statusCode": 200,
    "remarks": null,
    "traceId": "ed17e168-ea72-44b7-a3fa-23eb7bb334e9",
    "errors": null,
    "data": {
      "areas": [
        {
          "areaName": "Ground Floor",
          "id": 1
        },
        {
          "areaName": "Terrace",
          "id": 2
        },
        {
          "areaName": "Garden",
          "id": 3
        },
        {
          "areaName": "Take Away",
          "id": 4
        }
      ],
      "freeTables": [
        {
          "restaurantArea": "Take Away",
          "restaurantAreaId": 4,
          "dininTableId": 10,
          "diningTableName": "Take Away",
          "orderId": null,
          "startedAtUTC": null,
          "startedAt": null,
          "itemCount": 0,
          "tableStatus": null,
          "tableStatusId": 0,
          "orderStatus": null,
          "orderStatusId": 0,
          "paxCapacity": 0,
          "runningGuest": 0
        },
        {
          "restaurantArea": "Terrace",
          "restaurantAreaId": 2,
          "dininTableId": 7,
          "diningTableName": "Table 3",
          "orderId": null,
          "startedAtUTC": null,
          "startedAt": null,
          "itemCount": 0,
          "tableStatus": null,
          "tableStatusId": 0,
          "orderStatus": null,
          "orderStatusId": 0,
          "paxCapacity": 2,
          "runningGuest": 0
        }
      ],
      "menu": [
        {
          "id": 2,
          "name": "Lunch",
          "avatar": "string"
        },
        {
          "id": 1,
          "name": "Breakfast",
          "avatar": null
        },
        {
          "id": 4,
          "name": "Dinner",
          "avatar": null
        },
        {
          "id": 5,
          "name": "Snacks",
          "avatar": null
        }
      ],
      "menuCategory": [
        {
          "id": 1,
          "name": "Punjabi",
          "avatar": null
        },
        {
          "id": 2,
          "name": "Mughlai",
          "avatar": null
        },
        {
          "id": 3,
          "name": "Shakahari",
          "avatar": null
        }
      ],
      "menuItems": [
        {
          "menuItemId": 1,
          "name": "Grilled Chicken",
          "avatars": [],
          "menuItemPriceId": 1,
          "priceName": "Full",
          "price": 100,
          "discount": 0,
          "menuDescription": null,
          "priceDescription": "Full Price\n",
          "menuCategoryId": 1,
          "menuId": 2
        },
        {
          "menuItemId": 1,
          "name": "Grilled Chicken",
          "avatars": [],
          "menuItemPriceId": 4,
          "priceName": "Half",
          "price": 50,
          "discount": 0,
          "menuDescription": null,
          "priceDescription": "Half Price",
          "menuCategoryId": 1,
          "menuId": 2
        },
        {
          "menuItemId": 2,
          "name": "Rajma Chawal",
          "avatars": [],
          "menuItemPriceId": 2,
          "priceName": "Full",
          "price": 200,
          "discount": 0,
          "menuDescription": null,
          "priceDescription": "Full Price",
          "menuCategoryId": 1,
          "menuId": 2
        },
        {
          "menuItemId": 2,
          "name": "Rajma Chawal",
          "avatars": [],
          "menuItemPriceId": 5,
          "priceName": "Half",
          "price": 100,
          "discount": 0,
          "menuDescription": null,
          "priceDescription": "Half Price",
          "menuCategoryId": 1,
          "menuId": 2
        }
      ],
      "orderType": [
        {
          "id": 1,
          "name": "Din-In"
        },
        {
          "id": 2,
          "name": "Online"
        },
        {
          "id": 3,
          "name": "Take Away"
        }
      ],
      "assignTo": [
        {
          "id": 9,
          "name": "Waseem Ahmad",
          "firstName": "Waseem",
          "lastName": "Ahmad"
        }
      ]
    }
  };
  static const Map<String, Object?> dummyAllTable = {
    "success": true,
    "message": "Success",
    "statusCode": 200,
    "remarks": null,
    "traceId": "1bfca994-919f-486f-970c-35634daadce1",
    "errors": null,
    "data": {
      "tableStatus": [
        {
          "id": 1,
          "name": "Running"
        },
        {
          "id": 3,
          "name": "Reserved"
        },
        {
          "id": 2,
          "name": "Free"
        }
      ],
      "areas": [
        {
          "areaName": "Ground Floor",
          "id": 1
        },
        {
          "areaName": "Terrace",
          "id": 2
        },
        {
          "areaName": "Garden",
          "id": 3
        },
        {
          "areaName": "Take Away",
          "id": 4
        }
      ],
      "tables": [
        {
          "restaurantArea": "Ground Floor",
          "restaurantAreaId": 1,
          "dininTableId": 3,
          "diningTableName": "Table  1",
          "orderId": 3,
          "startedAtUTC": "2024-05-09T16:55:41Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 2,
          "tableStatus": "Running",
          "tableStatusId": 1,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 4,
          "runningGuest": 1
        },
        {
          "restaurantArea": "Take Away",
          "restaurantAreaId": 4,
          "dininTableId": 10,
          "diningTableName": "Take Away",
          "orderId": 7,
          "startedAtUTC": "2024-05-11T15:54:56Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 1,
          "tableStatus": "Free",
          "tableStatusId": 2,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 0,
          "runningGuest": 1
        },
        {
          "restaurantArea": "Ground Floor",
          "restaurantAreaId": 1,
          "dininTableId": 6,
          "diningTableName": "Table 2",
          "orderId": 4,
          "startedAtUTC": "2024-05-09T16:55:41Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 2,
          "tableStatus": "Running",
          "tableStatusId": 1,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 2,
          "runningGuest": 1
        },
        {
          "restaurantArea": "Terrace",
          "restaurantAreaId": 2,
          "dininTableId": 7,
          "diningTableName": "Table 3",
          "orderId": 5,
          "startedAtUTC": "2024-05-09T15:53:55Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 1,
          "tableStatus": "Free",
          "tableStatusId": 2,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 2,
          "runningGuest": 1
        },
        {
          "restaurantArea": "Terrace",
          "restaurantAreaId": 2,
          "dininTableId": 8,
          "diningTableName": "Table 4",
          "orderId": 6,
          "startedAtUTC": "2024-05-11T15:54:56Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 1,
          "tableStatus": "Reserved",
          "tableStatusId": 3,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 4,
          "runningGuest": 1
        },
        {
          "restaurantArea": "Garden",
          "restaurantAreaId": 3,
          "dininTableId": 13,
          "diningTableName": "Table 5",
          "orderId": 8,
          "startedAtUTC": "2024-05-11T15:54:56Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 1,
          "tableStatus": "Running",
          "tableStatusId": 1,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 2,
          "runningGuest": 1
        },
        {
          "restaurantArea": "Garden",
          "restaurantAreaId": 3,
          "dininTableId": 14,
          "diningTableName": "Table 6",
          "orderId": 9,
          "startedAtUTC": "2024-05-11T15:54:56Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 1,
          "tableStatus": "Running",
          "tableStatusId": 1,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 2,
          "runningGuest": 1
        },
        {
          "restaurantArea": "Garden",
          "restaurantAreaId": 3,
          "dininTableId": 15,
          "diningTableName": "Table 7",
          "orderId": 10,
          "startedAtUTC": "2024-05-11T15:54:56Z",
          "startedAt": "2024-05-11T21:24:56.323764",
          "itemCount": 1,
          "tableStatus": "Running",
          "tableStatusId": 1,
          "orderStatus": "Running",
          "orderStatusId": 1,
          "paxCapacity": 2,
          "runningGuest": 1
        }
      ]
    }
  };

}


//API status enums
enum ApiStatus { idle, started, completed, loading, searching, empty, failed, timeout }
