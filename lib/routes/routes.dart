import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_flutter/screens/dashboard/ui/dashboard_main_screen.dart';
import 'package:my_flutter/screens/otp/otp_screen.dart';
import 'package:my_flutter/screens/splace/ui/splaceScreen.dart';


import '../screens/dashboard/widgets/DrawerMenu.dart';
import '../screens/login/ui/login_screen.dart';
import '../screens/splace/ui/enter_url_screen.dart';

class RouteClass{
  static String home = "/";
  static String start = "/start";
  static String login = "/login";
  static String dashboard = "/dashboard";
  static String otpScreen = "/otpscreen";

  static String getHomeRoute()=> home;
  static String getEnterUrlRoute()=> start;
  static String getLoginScreen()=> login;
  static String getDashboard()=> dashboard;
  static String getOtpScreen()=> otpScreen;

  static List<GetPage> routes =[
      GetPage(name: home, page: ()=>const SplaceScreen()),
      GetPage(name: start, page: ()=>const EnterUrlScreen()),
      GetPage(name: login, page: ()=>const LoginScreen()),
      GetPage(name: login, page: ()=>const DashboadMainScreen()),
      GetPage(name: otpScreen, page: ()=>const OtpScreen(phone: "9643916691"))
  ];
}