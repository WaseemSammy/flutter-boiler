import 'package:flutter/cupertino.dart';
import 'package:my_flutter/screens/mobile/allTable/ui/alltable_screen.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_checkout_screen.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_order_screen.dart';

class WebOrdersMain extends StatefulWidget {
  const WebOrdersMain({super.key});

  @override
  State<WebOrdersMain> createState() => _WebOrdersMainState();
}

class _WebOrdersMainState extends State<WebOrdersMain> {



  @override
  Widget build(BuildContext context) {

      return const Row(
        children: [
          Expanded(
              flex: 3, child: WebOrderScreen()),
          Expanded(
              flex: 2,
              child: WebCheckoutScreen())
        ],
      );

  }
}
