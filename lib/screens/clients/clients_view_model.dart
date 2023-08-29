

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_flutter/models/clients/client_data_response.dart';
import 'package:my_flutter/models/clients/object_type_response.dart';
import 'package:my_flutter/models/clients/user_view_prefrences.dart';
import 'package:my_flutter/models/response_data_model.dart';
import 'package:my_flutter/services/api_service.dart';
import 'package:my_flutter/utils/utils_helper.dart';

import '../../api/ApiResponse.dart';

class ClientsViewModel extends GetxController{

   int? listId = 0;
   String? listName = "";
   String? sortName = "";
   String? sortDefaultDirection = "";
   int? sortOrder = 1;
   List<Data>? tempresp ;
   var clients = ApiResponse.error("");
   var subscribe = <ObjectData>[];
   var unsubscribe = <ObjectData>[];

  getClients(BuildContext context) async{
   var pageIndex = clients.data is ClientsDataResponse ==true ?  clients.data.filter?.page?.pageIndex??0 : 0;
    var url = "$listId?pageIndex=${pageIndex+1}&useListTags=true&orderBy=${sortName!}&sortOrder=$sortOrder";
    ResponseData  response = await ApiService().getClients(context: context, url: url);

    var clientRes = ClientsDataResponse.fromJson(response.body!);
    var pageI = clientRes?.filter?.page?.pageIndex??0;
     if( pageI> 1) {
       tempresp?.addAll(clientRes.data!);
     }else {
       tempresp = clientRes.data;
     }
     clientRes.data = tempresp;
     clients = ApiResponse.completed(clientRes);
    update();
    print("response");
  }

  initialApi(BuildContext context) async{
    var url = "";
    ResponseData objectTypeRes = await ApiService().getobjectType(context: context, url: url);

     var obejtype = ObjectTypeResponse.fromJson(objectTypeRes.body!);
     var segrated = await Utils.intence.segregateSubscribed(obejtype.data, subscribe, unsubscribe);
     subscribe = segrated["sub"];
     unsubscribe = segrated["unsub"];

     for (var element in subscribe) {
        if(element.listId == 40){
          listId = element.listId;
          listName = element.listName;
          break;
        }

        if(element.isDefault == true){
          listId = element.listId;
          listName = element.listName;
          break;
        }

        listId = subscribe.first.listId;
        listName = subscribe.first.listName;
     }
    ResponseData UserPrefRes = await ApiService().getuserPrefrences(context: context, url: url);
    var userprefRes = UserViewPrefrences.fromJson(UserPrefRes.body!);
    var userArray = <UserPrefData>[];
  for(var item in userprefRes.data!){
    var ViewModeId = item.viewModeId;
    if (ViewModeId == 1) {
      userArray.add(item);
      break;
    }
  }

  for(var filterItem in userArray){
    sortName = filterItem?.sortAttribute??'ClientFirstName';
    sortDefaultDirection = filterItem.sortDirection??"ASC";
  }
    if (sortDefaultDirection != null) {
      sortOrder = sortDefaultDirection == "ASC" ? 1 :  0;
    }

    getClients(context);

  }
}