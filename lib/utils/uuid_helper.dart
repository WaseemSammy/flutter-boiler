import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';
import 'package:uuid/uuid.dart';

class UUIDHelper {
 static final  uuid = Uuid();
  
  static Future<String?> getuniqueId(String username) async {
    var id = await checkSaveId();
     if(id?.isEmpty == true) {
       var uniqueId = username + uuid.v4();
       return uniqueId;
     }else{
       return id;
     }
  }

  static Future<String?> checkSaveId() async{
   var Id = await SharedPreferencesHelper.getValue(AppConstants.KEY_DEVICE_ID);
   return Id;
  }

}