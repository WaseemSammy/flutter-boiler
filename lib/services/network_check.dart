import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


import '../widgets/alert_bar.dart';

///Identifies Network Availability.
///Automated alert - flag controlled
///Things to change:
///              1. Message Alert widget - can be left default, change as per UI design.
///
class NetworkCheck {
  static Future<bool> check() async {
    print("Check internet");
    var connectivityResult = await (Connectivity().checkConnectivity());
    print("Check internet $connectivityResult");
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }

  static Future<bool> isOnline(BuildContext context, bool showError) async {
    print("Check internet");
    var connectivityResult = await (Connectivity().checkConnectivity());
    print("Check internet type $connectivityResult");
    print("Check internet ${connectivityResult  == ConnectivityResult.wifi}");
    if (connectivityResult == ConnectivityResult.mobile) {
      print("mobile");
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      print("wifi");
      return true;
    }
    debugPrint("No Internet");
    if (showError) {
      AlertBar.show(context,
          title: 'No Connectivity', description: 'Please Check Internet Connection', gravity: AlertBar.TOP, backgroundColor: Colors.red, duration: 0, icon: null);
    }

    return false;
  }

  dynamic checkInternet(Function func) {
    check().then((internet) {
      if (internet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
