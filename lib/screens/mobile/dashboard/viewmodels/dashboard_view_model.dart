import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_flutter/utils/request_map_utils.dart';

import '../../../../api/ApiResponse.dart';
import '../../../../models/response_data_model.dart';
import '../../../../services/api_service.dart';



class DashboardViewModel extends GetxController{
  var dashboardResponse = ApiResponse.idle();

  Future<void> getDashboardData(BuildContext context,restaurantId) async {
     dashboardResponse = ApiResponse.loading();
     update();
     try {
       var map = RequestMapUtils.intence.makePostRequestDashboard(restaurantId);
       ResponseData response = await ApiService().getDashboardData(context: context, map: map);
        print(response);
     }catch(e){
       if (kDebugMode) {
         print(e);
       }
     }
  }
}