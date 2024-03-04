import 'dart:convert';


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
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/small_text.dart';

import '../../../api/Status.dart';
import '../../../routes/routes.dart';
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
   // fetchAppSetting();
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
  //  _viewModel.getAppSetting(context,url);

  }

  validateAndLogin(String username, String password) async {
    if(username.isEmpty){
      return;
    }
    if(password.isEmpty){
      return;
    }

    print("clicked");
    Get.offAndToNamed(RouteClass.getDashboard());

  }
  @override
  Widget build(BuildContext context) {
    print("build");
    double w =  MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
   return GetBuilder<InputUrlViewModel>(
     init: InputUrlViewModel(),
       builder: (viewModel){

       return Scaffold(
         backgroundColor: Colors.white,
         body: SingleChildScrollView(
           child: Column(
             children: [
               Container(
                 width: w,
                 height: h*.3,
                 decoration: BoxDecoration(
                   image: DecorationImage(image:
                   AssetImage("assets/images/signup.png"),
                     fit: BoxFit.cover
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(left: 20),
                 width: w,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     BigText(text: "Hello",size: 30,color: Colors.black,),
                     SmallText(text: "Welcome",color: Colors.grey,),
                     SizedBox(height: 50,)
                   ],
                 ),
               ),
               Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Container(
                       child: CommonTextField(controller: usernameController,label: "",hint: "Username",isPassword: false),
                     decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           blurRadius: 5,
                           offset: Offset(.5, .5),
                           color: Colors.grey.withOpacity(0.5)
                         )
                       ]
                     ),
                   ),
                   SizedBox(height: 20,),
                   Container(child: CommonTextField(controller: passswordController,label: "",hint: "Password",isPassword: true),
                       decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                                 blurRadius: 5,
                                 offset: Offset(.5, .5),
                                 color: Colors.grey.withOpacity(0.5)
                             )
                           ]
                       )),
           
                   SizedBox(height: 20,),
                   SizedBox(
                     width: MediaQuery
                         .of(context)
                         .size
                         .width,
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                       ),
                         child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               primary: Colors.deepOrangeAccent[200],
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               elevation: 5
                             ),
                           child: BigText(text: "LOGIN", size: 18,color: Colors.white,),
                          onPressed: () {
                          validateAndLogin(usernameController.text, passswordController.text);
                       },)),
                   ),
           
                 ],
               ),
             ),
              ],
           ),
         ),
       );


    });

  }
}
