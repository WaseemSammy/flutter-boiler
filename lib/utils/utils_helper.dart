import 'dart:convert';
import 'dart:math';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/login/org_setting_response.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';

import '../constants/my_globals.dart' as global;
import '../models/clients/object_type_response.dart';


class Utils{
  Utils._();
  static final intence = Utils._();

  Future<OrgSettingResponse> getOrgSetting() async {
    String? rawResponse = await SharedPreferencesHelper.getValue(AppConstants.KEY_ORGANISATION_LIST);
    if(rawResponse!=null) {
      var response = json.decode(rawResponse);
      return OrgSettingResponse.fromJson(response);
    }else{
      return OrgSettingResponse();
    }

  }

  setColorsToGlobals() async {
    OrgSettingResponse orgSettingResponse = await getOrgSetting();
   var mainCOlor =  orgSettingResponse.data?.where((element) => element.paramName == "main_color");
    print("Waseem");
    global.bgColor = mainCOlor?.first?.paramValue;
  }

  Future<Map<String,dynamic>>segregateSubscribed(List<ObjectData>? mainList,List<ObjectData> subscribe,List<ObjectData> unsubscribe) async {
    if(mainList!=null) {
      for (var element in mainList!) {
        if (element.isSubscribed == true) {
          subscribe.add(element);
        } else {
          unsubscribe.add(element);
        }
      }
    }

    return{"sub":subscribe,"unsub":unsubscribe } ;
  }
  String getAlphaNameAlphabet(String? fname,String? lastName){
    var forw = fname?.substring(0,1)??"";
    var last = lastName?.substring(0,1)??"";
    return forw+last;
  }
}