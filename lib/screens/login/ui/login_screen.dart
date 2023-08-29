import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_flutter/constants/api_constants.dart';
import 'package:my_flutter/constants/app_constants.dart';
import 'package:my_flutter/models/AppSettingModel.dart';
import 'package:my_flutter/models/login_model.dart';

import 'package:my_flutter/utils/shared_preferences_helper.dart';
import 'package:my_flutter/constants/my_globals.dart' as globals;
import 'package:my_flutter/utils/uuid_helper.dart';

import '../../../api/Status.dart';
import '../../../widgets/common_text_field.dart';
import '../../dashboard/ui/dashboard_main_screen.dart';
import '../../dashboard/widgets/DrawerMenu.dart';
import '../../splace/viewmodel/input_url_viewmodel.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController serverUrlController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  final _viewModel  = Get.put(InputUrlViewModel());
  String? dropDownText = "";
  AppSettingModel? appSettingModel;
  Map<String, dynamic>? listmap;
  bool? addLayout = false;
  String loginurl = "";

  @override
  void initState() {
    print("inint");
    fetchAppSetting();
    usernameController.text = 'migration';
    passswordController.text = 'migration';
    super.initState();
  }

  fetchAppSetting() async {
    var model = await loginSetting();
    Map<String, dynamic>? fmap = await SharedPreferencesHelper.getMap(
        AppConstants.KEY_ORGANISATION_MAP);
    String? index = await SharedPreferencesHelper.getValue(
        AppConstants.KEY_SELECTED_LAST_INDEX);
    listmap = fmap;
    dropDownText = index;
    print(dropDownText);
    print(dropDownText);
    print(listmap.toString());

    setState(() {
      appSettingModel = model;
      listmap = fmap;
      globals.baseUrl =  listmap?[dropDownText];
      print("object : " +globals.baseUrl + "  "+listmap?[dropDownText]);
    });
  }

  Future<AppSettingModel> loginSetting() async {
    String? json = await SharedPreferencesHelper.getValue(
        AppConstants.KEY_APPSETTINGS);
    return AppSettingModel.fromJson(jsonDecode(json!));
  }



  Widget getWidget(InputUrlViewModel viewModel){

    if(viewModel.appSettingResponse.status == Status.COMPLETED) {
      globals.baseUrl =  loginurl;
      saveAppSetting(viewModel.appSettingResponse.data!);
    }  else {
      return Container();
    }

    return Container();
  }

  saveAppSetting(AppSettingModel myappSettingModel) async {

    var json = jsonEncode(myappSettingModel.toJson());
   await SharedPreferencesHelper.saveValue(AppConstants.KEY_APPSETTINGS, json);
    SharedPreferencesHelper.saveBooleanValue(AppConstants.KEY_ISSERVER_CONFIGURED, true);
    SharedPreferencesHelper.saveValue(AppConstants.KEY_SELECTED_LAST_INDEX, myappSettingModel?.data?.organizationName??"");
    SharedPreferencesHelper.saveValue(AppConstants.KEY_SERVER_URL, serverUrlController.text.toString());


    Map<String, dynamic>? fmap =  await SharedPreferencesHelper.getMap(AppConstants.KEY_ORGANISATION_MAP);
    Map<String,dynamic> myMap = Map.from( fmap as Map );
    if(myappSettingModel.data?.organizationName!=null) {
      myMap[myappSettingModel.data?.organizationName.toString()??""] = loginurl;
    }

    SharedPreferencesHelper.setMap(AppConstants.KEY_ORGANISATION_MAP,jsonEncode(myMap));
    listmap = myMap;
    serverUrlController.clear();
    addLayout = false;
    setState(() {
      appSettingModel = myappSettingModel;

    });
    _viewModel.appSettingResponse.status = Status.IDLE;
  }

  validationAndCheck(String url) {
    setState(() {
      loginurl = url;
    });
    if (url.isEmpty) {
      return;
    }
    if (!url.contains("https://")) {
      return;
    }
    _viewModel.getAppSetting(context,url);

  }

  validateAndLogin(String username, String password) async {
    if(username.isEmpty){
      return;
    }
    if(password.isEmpty){
      return;
    }
    var deviceId = await UUIDHelper.getuniqueId(username);
    SharedPreferencesHelper.saveValue(AppConstants.KEY_DEVICE_ID, deviceId??"");
    LoginModel loginModelRequest = LoginModel(UserName: username,Password: password,DeviceId: deviceId,NotificationDeviceToken: "sfdsfwewewe");
    print(loginModelRequest.toMap());

    _viewModel.loginUser(context, loginModelRequest,appSettingModel);

    //Get.off(() => DashboadMainScreen());

  }
  @override
  Widget build(BuildContext context) {
    print("build");

   return GetBuilder<InputUrlViewModel>(
     init: InputUrlViewModel(),
       builder: (viewModel){

       return Scaffold(body: Container(
         decoration: BoxDecoration(
             image: DecorationImage(image: CachedNetworkImageProvider(
               "${globals.baseUrl}${ApiConstants
                   .IMAGE_BACKGROUND_URL}${appSettingModel?.data
                   ?.loginScreenSetting?.mobileSplashBackground ?? ""}",),
                 fit: BoxFit.fill)
         ),
         child: Stack(
           children: [
             Container(
             alignment: Alignment.bottomCenter,
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 if(addLayout == true) Row(
                   children: [
                     Expanded(
                       child: Container(
                         height: 50,
                         width: MediaQuery
                             .of(context)
                             .size
                             .width,
                         child: CommonTextField(controller: serverUrlController,label: "",hint: "Enter Url here",isPassword: false),
                       ),
                     ),
                     SizedBox(width: 10,),
                     InkWell(
                       onTap: () =>
                       {
                         validationAndCheck(serverUrlController.text.toString())
                       },
                       child: Container(
                           height: 50,
                           width: 50,
                           color: Colors.blue,
                           child: Icon(
                             Icons.arrow_forward_rounded,
                             color: Colors.white,
                           )),
                     ),
                     SizedBox(width: 10,),
                     InkWell(
                       onTap: () =>
                       {
                         setState(() {
                           addLayout = false;
                         })
                       },
                       child: Container(
                           height: 50,
                           width: 50,
                           color: Colors.blue,
                           child: Icon(
                             Icons.cancel_outlined,
                             color: Colors.white,
                           )),
                     )
                   ],
                 ) else
                   Row(
                     children: [
                       Expanded(
                         child: Container(
                           height: 50,
                           width: MediaQuery
                               .of(context)
                               .size
                               .width,
                           child: DropdownButtonHideUnderline(
                             child: GFDropdown(
                                 value: dropDownText ?? "",
                                 isExpanded: true,
                                 isDense: true,
                                 border: const BorderSide(
                                     color: Colors.white),
                                 dropdownButtonColor: Colors.white,
                                 onChanged: (newValue) {
                                   print(newValue);
                                   setState(() {
                                     dropDownText = newValue;
                                   });

                                   String url = listmap?[newValue];
                                   print(url);
                                   validationAndCheck(url);
                                 },
                                 items: listmap?.entries.map((entry) =>
                                     DropdownMenuItem(
                                       child: Text(entry.key), value: entry.key,))
                                     .toList()
                             ),
                           ),
                         ),
                       ),
                       SizedBox(width: 10,),
                       InkWell(
                         onTap: () =>
                         {
                           setState(() {
                             addLayout = true;
                           })
                         },
                         child: Container(
                             height: 50,
                             width: 50,
                             color: Colors.blue,
                             child: Icon(
                               Icons.add,
                               color: Colors.white,
                             )),
                       )
                     ],
                   ),
                 SizedBox(height: 10,),
                 CommonTextField(controller: usernameController,label: "",hint: "Username",isPassword: false),
                 SizedBox(height: 10,),
                 CommonTextField(controller: passswordController,label: "",hint: "Password",isPassword: true),
                 SizedBox(
                   width: MediaQuery
                       .of(context)
                       .size
                       .width,
                   child: Hero(tag: "login_btn", child: ElevatedButton(
                     child: Text("Login"),
                     onPressed: () {
                        validateAndLogin(usernameController.text, passswordController.text);
                     },)),
                 ),

               ],
             ),
           ),
             Center(child: getWidget(viewModel))],
         ),
       ),);


    });

  }
}
