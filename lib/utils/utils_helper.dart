import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/login/org_setting_response.dart';
import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';
import 'package:my_flutter/widgets/big_text.dart';

import '../constants/my_globals.dart' as global;
import '../models/clients/object_type_response.dart';
import '../widgets/big_text_center.dart';


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

  void showCustomerDialog(BuildContext ctx){
   showDialog(context: ctx, builder: (BuildContext context){
      return Responsive(
         mobile: getWidget(1,context),
         tablet: getWidget(2,context),
         desktop: getWidget(3,context),
       );
   });
  }

  Widget getWidget(type,BuildContext ctx){
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft:Radius.circular(15) ,bottomRight:Radius.circular(15))

        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BigText(text: "Select Customer",color: CupertinoColors.black,size: 20,),
                ),
                SizedBox(
                  height: (type == 1) ? MediaQuery.of(ctx).size.height/3 : MediaQuery.of(ctx).size.height/2 ,
                  child: MediaQuery.removePadding(
                    removeBottom: true,
                    context: ctx,
                    child: GridView.count(
                        crossAxisCount: (type == 1) ? 5 : 10,
                        shrinkWrap: true,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(20, (index) {
                          return Container(
                            margin: const EdgeInsets.all(6),
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '${index+1}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        )
                    ),
                  ),),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15) ,bottomRight:Radius.circular(15)),
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: BigTextCenter(text: "Next",color: Colors.white,size: 20,),),
              ]),
        ),
      ),
    );
  }
}