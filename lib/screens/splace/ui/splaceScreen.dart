import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/screens/splace/ui/enter_url_screen.dart';
import 'package:my_flutter/utils/shared_preferences_helper.dart';

import '../../../constants/app_constants.dart';
import '../../../routes/routes.dart';
import '../../login/ui/login_screen.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/mydesqlogo.png'),
      ),
    );
  }

   Future<bool> fetchData() async{
    var map = await SharedPreferencesHelper.getMap(AppConstants.KEY_ORGANISATION_MAP);
    if(map?.isEmpty == true){
      return false;
    }else{
      return true;
    }
  }

  @override
  void initState() {

    super.initState();
    Timer(
        const Duration(seconds: 3),
            () async => {
               if (await fetchData())  Get.off(() => LoginScreen()) else  Get.off(() => EnterUrlScreen())
            });
  }
}