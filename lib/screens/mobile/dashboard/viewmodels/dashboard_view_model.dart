import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/dashboard_response.dart';
import 'package:my_flutter/utils/request_map_utils.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';

import '../../../../api/ApiResponse.dart';
import '../../../../models/response_data_model.dart';
import '../../../../services/api_service.dart';



class DashboardViewModel extends GetxController{
  var dashboardResponse = ApiResponse.loading();
  var dummy = {
    "success": true,
    "message": "Success",
    "statusCode": 200,
    "remarks": null,
    "traceId": "7abb4604-bae2-4062-8bee-f777612e5ebb",
    "errors": null,
    "data": {
      "orderStatus": [
        {
          "id": 2,
          "name": "Completed",
          "currentCount": 0
        },
        {
          "id": 1,
          "name": "Running",
          "currentCount": 2
        },
        {
          "id": 3,
          "name": "Preparing",
          "currentCount": 0
        },
        {
          "id": 4,
          "name": "Served",
          "currentCount": 0
        }
      ],
      "allTableCount": 5,
      "runningTableCount": 2,
      "currentOrders": [
        {
          "restaurantArea": "Ground Floor",
          "restaurantAreaId": 1,
          "orders": [
            {
              "restaurantArea": "Ground Floor",
              "restaurantAreaId": 1,
              "dininTableId": 6,
              "diningTableName": "Table 2",
              "orderId": 4,
              "startedAtUTC": "2024-05-09T16:55:41Z",
              "startedAt": "2024-05-09T22:25:41.3325",
              "itemCount": 2,
              "orderStatusId": 1,
              "orderStatusName": "Running",
              "assignedTo": 7,
              "assignedToName": "Sayeed"
            },
            {
              "restaurantArea": "Ground Floor",
              "restaurantAreaId": 1,
              "dininTableId": 3,
              "diningTableName": "Table  1",
              "orderId": 3,
              "startedAtUTC": "2024-05-09T16:55:41Z",
              "startedAt": "2024-05-09T22:25:41.3325",
              "itemCount": 2,
              "orderStatusId": 1,
              "orderStatusName": "Running",
              "assignedTo": 7,
              "assignedToName": "Sayeed"
            }
          ]
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
      ]
    }
  };

  Future<void> getDashboardData(BuildContext context,restaurantId) async {
     dashboardResponse = ApiResponse.loading();
     update();
     try {
       //var map = RequestMapUtils.intence.makePostRequestDashboard(restaurantId);
       ResponseData response = await ApiService().getDashboardData(context: context,  resId: restaurantId);
        print(response.body);
       if (response.statusCode == 200) {
         var data = DashboardResponse.fromJson(response.body!);
         SharedPreferencesHelper.saveValue(AppConstants.KEY_AREA, jsonEncode(data.data?.areas));
         dashboardResponse  = ApiResponse.completed(data);

         update();
         // update();
       }else{
         var data = DashboardResponse.fromJson(dummy);
         SharedPreferencesHelper.saveValue(AppConstants.KEY_AREA, jsonEncode(data.data?.areas));
         dashboardResponse  = ApiResponse.completed(data);
        // dashboardResponse = ApiResponse.error(response.message);
         update();
       }
     }catch(e){
       if (kDebugMode) {
         print(e);
       }
     }
  }
}