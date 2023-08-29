import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_flutter/api/ApiResponse.dart';
import 'package:my_flutter/api/Status.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/AppSettingModel.dart';
import 'package:my_flutter/screens/login/ui/login_screen.dart';
import 'package:my_flutter/screens/splace/viewmodel/input_url_viewmodel.dart';
import 'package:my_flutter/constants/my_globals.dart' as global;
import 'package:my_flutter/utils/shared_preferences_helper.dart';

import '../../../routes/routes.dart';
class EnterUrlScreen extends StatefulWidget {
  const EnterUrlScreen({Key? key}) : super(key: key);

  @override
  State<EnterUrlScreen> createState() => _EnterUrlScreenState();
}

class _EnterUrlScreenState extends State<EnterUrlScreen> {
  TextEditingController serverUrlController = TextEditingController();
  final _viewModel  = Get.put(InputUrlViewModel());

  validationAndCheck() {
   String url = serverUrlController.text.toString();
    if (url.isEmpty) {
      return;
    }

    if (!url.contains("https://")) {
      return;
    }
    _viewModel.getAppSetting(context,url);

  }
  saveAppSetting(AppSettingModel appSettingModel) async {

    var json = jsonEncode(appSettingModel.toJson());
    SharedPreferencesHelper.saveValue(AppConstants.KEY_APPSETTINGS, json);
    SharedPreferencesHelper.saveBooleanValue(AppConstants.KEY_ISSERVER_CONFIGURED, true);
    SharedPreferencesHelper.saveValue(AppConstants.KEY_SELECTED_LAST_INDEX, appSettingModel.data?.organizationName??"");
    SharedPreferencesHelper.saveValue(AppConstants.KEY_SERVER_URL, serverUrlController.text.toString());


    Map<String, dynamic>? fmap =  await SharedPreferencesHelper.getMap(AppConstants.KEY_ORGANISATION_MAP);
    Map<String,dynamic> myMap = Map.from( fmap as Map );
    if(appSettingModel.data?.organizationName!=null) {
      myMap[appSettingModel.data?.organizationName.toString()??""] = serverUrlController.text.toString();
    }

    SharedPreferencesHelper.setMap(AppConstants.KEY_ORGANISATION_MAP,jsonEncode(myMap));
    Get.off(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputUrlViewModel>(builder: (viewModel) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset("assets/images/serveraddress_bg.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/mydesqlogo.png")),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: serverUrlController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onSaved: (email) {},
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter server Url",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: ()=> validationAndCheck(),
                      child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.blue,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                    )
                  ]),
                ),
              ),
              getWidget(viewModel)



            ],
          ),
        ),
      );
    });

  }

  Widget getWidget(InputUrlViewModel viewModel){
    if(viewModel.appSettingResponse.status == Status.LOADING) {
      return const GFLoader(type: GFLoaderType.ios);
    } else if(viewModel.appSettingResponse.status == Status.COMPLETED) {
        print(viewModel.appSettingResponse.data?.data?.notificationHubBaseUri);
        global.baseUrl = serverUrlController.text.toString();
        saveAppSetting(viewModel.appSettingResponse.data!);
    } else {
      return Container();
     }
     return Container();
    }

    @override
  void dispose() {
    // TODO: implement dispose
      super.dispose();
    _viewModel.onClose();
  }
}
