import 'package:flutter/cupertino.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_checkout_screen.dart';
import 'package:my_flutter/screens_web_admin/web_orders/ui/web_order_screen.dart';
import 'package:my_flutter/utils/responsive.dart';

class WebOrdersMain extends StatefulWidget {
  const WebOrdersMain({super.key});

  @override
  State<WebOrdersMain> createState() => _WebOrdersMainState();
}

class _WebOrdersMainState extends State<WebOrdersMain> {



  @override
  Widget build(BuildContext context) {

      return Responsive(
          mobile: getView(1),
          tablet: getView(2),
          desktop: getView(3));

  }

  Widget getView(int type){
     if(type == 1) {
       return  WebOrderScreen(type);
     }else {
       return  Row(
         children: [
           Expanded(
               flex: 4, child: WebOrderScreen(type)),
           const Expanded(
               flex: 2,
               child: WebCheckoutScreen())
         ],
       );
     }
  }
}
