import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_flutter/screens/mobile/running/ui/running_screen.dart';
import 'package:my_flutter/screens/web/web_dashboard/web_dashboard_screen.dart';

import '../screens/mobile/allTable/ui/alltable_screen.dart';
import '../screens/mobile/dashboard/ui/dashboard_main_screen.dart';
import '../screens/mobile/login/ui/login_screen.dart';
import '../screens/mobile/orders/ui/confirm_order_screen.dart';
import '../screens/mobile/orders/ui/order_screen.dart';
import '../screens/mobile/otp/otp_screen.dart';
import '../screens/mobile/splace/ui/enter_url_screen.dart';
import '../screens/mobile/splace/ui/splaceScreen.dart';



class RouteClass{
  static String home = "/";
  static String start = "/start";
  static String login = "/login";
  static String dashboard = "/dashboard";
  static String otpScreen = "/otpscreen";
  static String orderScreen = "/order/";
  static String orderConfirm = "/orderConfirm";
  static String runningOrder = "/runningOrder";
  static String alltable = "/alltable";

  static String getHomeRoute()=> home;
  static String getEnterUrlRoute()=> start;
  static String getLoginScreen()=> login;
  static String getDashboard()=> dashboard;
  static String getOtpScreen()=> otpScreen;
  static String getOrderScreen()=> orderScreen;
  static String getOrderConfirm()=> orderConfirm;
  static String getRunningOrders()=> runningOrder;
  static String getAllTable()=> alltable;

  static List<GetPage> routes =[
      GetPage(name: home, page: ()=>const SplaceScreen(), ),
      GetPage(name: start, page: ()=>const EnterUrlScreen()),
      GetPage(name: login, page: ()=>const LoginScreen(),),
      GetPage(name: dashboard, page: ()=>const DashboadMainScreen(),  ),
      GetPage(name: "$orderScreen/:id/:nc", page: ()=>const OrdersScreen(),),
      GetPage(name: otpScreen, page: ()=>const OtpScreen(phone: "9643916691")),
      GetPage(name: orderConfirm, page: ()=>const ConfirmOrderScreen()),
      GetPage(name: runningOrder, page: ()=>const RunningOrders()),
      GetPage(name: alltable, page: ()=>const AllTableScreen())
  ];
}