import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/screens/mobile/orders/viewmodel/table_order_viewmodel.dart';
import 'package:my_flutter/screens/newDesign/components/NavigationController.dart';
import 'package:my_flutter/screens/newDesign/menuScreen/menu_screen.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_checkout_screen.dart';

import 'package:my_flutter/utils/responsive.dart';

import '../../../constants/app_colors.dart';
import '../../../models/cartItems.dart';
import '../../../routes/routes.dart';
import '../../mobile/common/common_app_bar.dart';
import '../../mobile/orders/ui/order_screen.dart';
import '../Table/table_screen.dart';
import '../components/paymentDetail.dart';
import '../sizeConfig.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  Navigationcontroller controller = Get.put(Navigationcontroller());

  int selectedRoute = 0;

  selectedMenu(Orders order, int count, int type) {
    if (kDebugMode) {
      print("$order $count $type");
    }
    // _viewModel.add(order, count, type==1 ?"Half" : "Full");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            flex: 10,
            child: Navigator(
                key: Get.nestedKey(1),
                initialRoute: controller.currentPage,
                onGenerateRoute: (settings) {
                  print(" Setting ${settings.name}");
                  return GetPageRoute(page: () {
                    if (settings.name == RouteClass.table) {
                      return TableScreen(onPressed: () {
                        print("yaahna");
                        print("${controller.currentPage}}");
                        controller.changePage(RouteClass.menu);
                        Get.toNamed(RouteClass.menu, id: 1);
                      });
                    } else if (settings.name == RouteClass.menu) {
                      print("option menu");
                      return MenuScreen(selectedMenu);
                    }
                    return Container();
                  });
                })),
        if (Responsive.isDesktop(context) || Responsive.isTablet(context))
          Expanded(
            flex: 4,
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                decoration: const BoxDecoration(color: AppColors.secondaryBg),
                child: const WebCheckoutScreen(),
              ),
            ),
          ),
      ],
    ));
  }
}
