import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_flutter/screens/dashboard/ui/dashboard_main_screen.dart';
import 'package:my_flutter/screens/orders/ui/confirm_order_screen.dart';
import 'package:my_flutter/screens/orders/ui/order_screen.dart';
import 'package:my_flutter/screens/otp/otp_screen.dart';
import 'package:my_flutter/screens/splace/ui/splaceScreen.dart';
import 'package:my_flutter/screens/running/ui/running_screen.dart';



import '../screens/allTable/ui/alltable_screen.dart';
import '../screens/dashboard/widgets/DrawerMenu.dart';
import '../screens/login/ui/login_screen.dart';
import '../screens/splace/ui/enter_url_screen.dart';

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
      GetPage(name: dashboard, page: ()=>const DashboadMainScreen(), ),
      GetPage(name: "$orderScreen/:id", page: ()=>const OrdersScreen()),
      GetPage(name: otpScreen, page: ()=>const OtpScreen(phone: "9643916691")),
      GetPage(name: orderConfirm, page: ()=>const ConfirmOrderScreen(),),
      GetPage(name: runningOrder, page: ()=>const RunningOrders()),
      GetPage(name: alltable, page: ()=>const AllTableScreen())
  ];
}