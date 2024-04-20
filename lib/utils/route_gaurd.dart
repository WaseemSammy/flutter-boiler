import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:my_flutter/routes/routes.dart';

class RouteGuard extends GetMiddleware {
  bool isAuthenticated = true;

  @override
  RouteSettings? redirect(String? route) {
    print("$isAuthenticated $route");
    if (!isAuthenticated) {
      return RouteSettings(name: RouteClass.login);
    } else {
      return RouteSettings(name: route);
    }
  }
}
