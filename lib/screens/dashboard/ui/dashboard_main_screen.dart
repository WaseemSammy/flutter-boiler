import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/screens/clients/clients_view_model.dart';
import 'package:my_flutter/screens/dashboard/widgets/DashboardAppBar.dart';
import 'package:my_flutter/screens/dashboard/widgets/DrawerMenu.dart';
import '../../../constants/app_constants.dart';
import '../../clients/ui/clients_list_Screen.dart';

class DashboadMainScreen extends StatefulWidget {
  const DashboadMainScreen({Key? key}) : super(key: key);

  @override
  State<DashboadMainScreen> createState() => _DashboadMainScreenState();
}

class _DashboadMainScreenState extends State<DashboadMainScreen> {

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
    return GetBuilder<ClientsViewModel>(
      init: ClientsViewModel(),
      builder: (viewModel) {

      print(viewModel.subscribe??[]);
      return Scaffold(
        appBar: DashboardAppBar(arrowEnabled: arrowEnable,subsrcibe: viewModel.subscribe),
        drawer: DrawerMenu(callback: onSelect),
        body: getWidgetScreen(selectedIndex),
      );
    },);

  }

  getWidgetScreen(int pos){
     switch(pos){
       case 0 :
         return ClientsScreen();
       case 1 :
         return Container();
     }
  }

}
