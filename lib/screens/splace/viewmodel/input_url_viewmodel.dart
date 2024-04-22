
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_flutter/api/ApiResponse.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/login/login_response_model.dart';
import 'package:my_flutter/screens/dashboard/ui/dashboard_main_screen.dart';
import 'package:my_flutter/services/api_service.dart';
import 'package:my_flutter/services/hub_connection_helper.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';
import 'package:my_flutter/utils/utils_helper.dart';

import '../../../models/AppSettingModel.dart';
import '../../../models/login_model.dart';
import '../../../models/response_data_model.dart';
import '../../../constants/my_globals.dart' as globals;
import '../../../routes/routes.dart';

class InputUrlViewModel extends GetxController {
    var appSettingResponse = ApiResponse.error("");
    var loginResponse = ApiResponse.error("");



  getAppSetting(BuildContext context,String url) async {
    appSettingResponse = ApiResponse.loading();
    update();
    try {
      ResponseData response = await ApiService()
          .appNewSetting(context: context, logInWithCommonLoader: true,url);
      if (response.statusCode == 200) {

        var data = AppSettingModel.fromJson(response.body!);
        appSettingResponse = ApiResponse.completed(data);
        print("Success");
        update();
      }else{
        appSettingResponse = ApiResponse.error(response.message);
        update();
      }
    } catch (e) {
      print(e);
      appSettingResponse = ApiResponse.error("message");
    }
  }

  loginUser(BuildContext context,LoginModel loginModel) async{


    try {
      loginResponse = ApiResponse.loading();
      update();
      ResponseData response = await ApiService()
          .loginUser(context: context, logInWithCommonLoader: true,loginModel: loginModel);
      Get.offAndToNamed(RouteClass.getDashboard());
      if (response.statusCode == 200) {
        var data = LoginModelResponse.fromJson(response.body!);
        loginResponse  = ApiResponse.completed(data);
        globals.loginData = loginResponse.data;
        Get.offAndToNamed(RouteClass.getDashboard());

       // update();
      }else{
        loginResponse = ApiResponse.error(response.message);
        update();
      }
    } catch (e) {
      print(e);
      loginResponse = ApiResponse.error("message");
      update();
    }
  }
}
