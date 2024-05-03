import 'package:flutter/material.dart';

import '../../../../constants/app_constants.dart';
import '../widgets/DrawerMenu.dart';
import 'home_screen.dart';




class DashboadMainScreen extends StatefulWidget {
  const DashboadMainScreen({Key? key}) : super(key: key);

  @override
  State<DashboadMainScreen> createState() => _DashboadMainScreenState();
}

class _DashboadMainScreenState extends State<DashboadMainScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selectedIndex = 0;
  bool arrowEnable = false;
   void onSelect(int index,String menuName){
        print(index);
        setState(() {
          if(menuName==AppConstants.Clients) {
            arrowEnable = true;
          }else{
            arrowEnable = false;
          }
          selectedIndex = index;
        });
   }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: _key,
        endDrawer: DrawerMenu(callback: onSelect),
        body: getWidgetScreen(selectedIndex),
      );
  }

  getWidgetScreen(int pos){
     switch(pos){
       case 0 :
         return const HomeScreen();
       case 1 :
         return Container();
     }
  }

}
