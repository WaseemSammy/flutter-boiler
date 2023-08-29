import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_flutter/api/ApiResponse.dart';
import 'package:my_flutter/api/Status.dart';
import 'package:my_flutter/constants/app_colors.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/login/login_response_model.dart';
import 'package:my_flutter/models/login/org_setting_response.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/dashboard/ui/dashboard_main_screen.dart';
import 'package:my_flutter/services/api_service.dart';
import 'package:my_flutter/services/hub_connection_helper.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';
import 'package:my_flutter/utils/utils_helper.dart';

import '../../../models/AppSettingModel.dart';
import '../../../models/login_model.dart';
import '../../../models/response_data_model.dart';
import '../../../constants/my_globals.dart' as globals;

class InputUrlViewModel extends GetxController {
    var appSettingResponse = ApiResponse.error("");
    var loginResponse = ApiResponse.error("");


    @override
    void onInit() {
      super.onInit();
    }

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

  loginUser(BuildContext context,LoginModel loginModel, AppSettingModel? appSettingModel) async{


    try {
      loginResponse = ApiResponse.loading();
      update();
      ResponseData response = await ApiService()
          .loginUser(context: context, logInWithCommonLoader: true,loginModel: loginModel);

      if (response.statusCode == 200) {
        var data = LoginModelResponse.fromJson(response.body!);
        loginResponse  = ApiResponse.completed(data);
        globals.loginData = loginResponse.data;

        if(data.message?.messageCode==200) {
          ResponseData orgsetting = await ApiService().getOrgSetting(
              context: context);
          SharedPreferencesHelper.saveValue(AppConstants.KEY_ORGANISATION_LIST,
              orgsetting.rawResponseBody ?? "");
          Utils.intence.setColorsToGlobals();
          ResponseData default_tree = await ApiService().getOrgSetting(
              context: context);
          ResponseData notificationUrl = await ApiService().getNotificationUrl(
              context: context);
          var json = notificationUrl.body!["Data"];
          String token = json["Result"];
          HubConnectionHelper.getInstance("${appSettingModel?.data
              ?.notificationHubBaseUri}/notificationHub?token=$token");

          Get.offAll(()=>DashboadMainScreen());
        }

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
