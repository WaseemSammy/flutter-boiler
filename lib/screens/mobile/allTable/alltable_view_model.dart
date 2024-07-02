import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/all_table_response.dart';

import '../../../api/ApiResponse.dart';
import '../../../models/response_data_model.dart';
import '../../../services/api_service.dart';

class AllTableViewModel extends GetxController{
  var allTableResponse = ApiResponse.loading();

  Future<void> getAllTableData(BuildContext context,restaurantId) async {
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