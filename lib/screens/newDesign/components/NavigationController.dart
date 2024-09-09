import 'package:get/get.dart';
import 'package:my_flutter/routes/routes.dart';

class Navigationcontroller extends GetxController{
  // Observes the current page that is active
  var currentPage = RouteClass.table;
  // Observes the current page that is active
  void changePage(String route) {
    print("ROunt $route");
    currentPage = route;
  }
  bool handlePopPage() {
    if (currentPage != '/home') {
      // If the user is not on the home page, pop the current route
      changePage('/home');
      return false; // Prevent the default pop behavior
    }
    return true; // Allow default pop behavior when on the home page
  }
}