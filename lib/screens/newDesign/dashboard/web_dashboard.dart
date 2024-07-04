import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/screens/mobile/common/common_app_bar.dart';
import 'package:my_flutter/screens_web_admin/web_main_body.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_checkout_screen.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_order_screen.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_orders_main.dart';
import 'package:my_flutter/utils/responsive.dart';

import 'package:sidebarx/sidebarx.dart';

import '../../mobile/dashboard/viewmodels/dashboard_view_model.dart';



const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class WebDashboard extends StatefulWidget {


  const WebDashboard({super.key});

  @override
  State<WebDashboard> createState() => _WebDashboardState();
}

class _WebDashboardState extends State<WebDashboard> {
  int selectedIndex = 0;

  final _viewModel  = Get.put(DashboardViewModel());
  @override
  void initState() {
    super.initState();
    _viewModel.getDashboardData(context, 1);
  }

  final _sidebarController = SidebarXController(
      selectedIndex: 0,extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: getMainView(1),
        tablet: getMainView(2),
        desktop: getMainView(3));
  }

  Widget  getMainView(type){
   return Scaffold(
        key: _key,
        appBar: type==1 ? const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CommonAppBar("",false),
        ) : null,
        drawer: SideBar(),
        body: Row(
          children: [
            if(type !=1) SideBar(),
            const Expanded(child: WebOrderScreen())
          ],
        )
    );
  }

  Widget SideBar() {
    return SidebarX(
        controller: _sidebarController,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          hoverColor: scaffoldBackgroundColor,
          textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          selectedTextStyle: const TextStyle(color: Colors.white),
          hoverTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: canvasColor),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: actionColor.withOpacity(0.37),
            ),
            gradient: const LinearGradient(
              colors: [accentCanvasColor, canvasColor],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 30,
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.7),
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
        ),
        extendedTheme: const SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: canvasColor,
          ),
        ),
        footerDivider: divider,
        headerBuilder: (context, extended) {
          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/images/biryani_image.webp'),
            ),
          );
        },
      items:  [
        SidebarXItem(icon: Icons.home,label: "Home",onTap: () => selectedMenu(0)),
        SidebarXItem(icon: Icons.restaurant_menu,label: "Orders",onTap: () => selectedMenu(1)),
        SidebarXItem(icon: Icons.restaurant,label: "Menu",onTap: () => selectedMenu(2)),
        SidebarXItem(icon: Icons.settings,label: "Setting",onTap: () => selectedMenu(3))
      ],
    );
  }
  void selectedMenu(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}
