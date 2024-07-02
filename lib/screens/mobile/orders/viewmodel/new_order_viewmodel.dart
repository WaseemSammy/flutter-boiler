import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../api/ApiResponse.dart';
import '../../../../constants/app_constants.dart';
import '../../../../models/all_table_response.dart';
import '../../../../models/response_data_model.dart';
import '../../../../services/api_service.dart';

class NewOrderViewModdel extends GetxController{

  var allTableResponse = ApiResponse.loading();

  Future<void> getprocessNewOrder(BuildContext context,restaurantId) async {
    allTableResponse = ApiResponse.loading();
    update();
    try {
      //var map = RequestMapUtils.intence.makePostRequestDashboard(restaurantId);
      ResponseData response = await ApiService().getAllTable(context: context,  resId: restaurantId);
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        var data = AllTableResponse.fromJson(response.body!);
        allTableResponse  = ApiResponse.completed(data);
        update();
        // update();
      }else{
        var data = AllTableResponse.fromJson(AppConstants.dummyAllTable);
        allTableResponse  = ApiResponse.completed(data);
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