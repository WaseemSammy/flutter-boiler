import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../constants/color_constants.dart';
import '../../../models/AppSettingModel.dart';
import '../../../models/cartItems.dart';
import '../../../screens/mobile/orders/ui/widgets/order_summary.dart';
import '../../../screens/mobile/orders/viewmodel/table_order_viewmodel.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/big_text_center.dart';
import '../../../widgets/small_text.dart';

class WebCheckoutScreen extends StatefulWidget {
  const WebCheckoutScreen({super.key});

  @override
  State<WebCheckoutScreen> createState() => _WebCheckoutScreenState();
}

class _WebCheckoutScreenState extends State<WebCheckoutScreen> {
  final _viewModel  = Get.put(TableOrderViewModel());
  int? ref = 0;



  @override
  void initState() {

    _viewModel.getCartData();
    super.initState();
  }

  void add(Orders cartItem ,int tableItem,String portionType){
    _viewModel.add(cartItem, tableItem, portionType);
  }

  void remove(String itemName,String portionType){
    _viewModel.removeFromCart(itemName, portionType);
  }

  @override
  Widget build(BuildContext context) {



    refresh(){
      setState(() {
        if(ref==0) {
          ref = 1;
        }else{
          ref = 0;
        }
      });
    }
    return Scaffold(
      body: Container(
          color: ColorConstants.AppBackgroundColor,
          child: GetBuilder<TableOrderViewModel>(
              init: TableOrderViewModel(),
              builder: (viewmodel){
                return  Column(
                  children: [
                    BigText(text: "Orders",size: 20,),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:viewmodel.cartItemData.length??0,
                        itemBuilder: (context, index) {
                          return OrderSummary(viewmodel.cartItemData[index],add,remove);
                        }
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(margin: const EdgeInsets.only(right: 10),
                          child: SmallText(text: "Total : ${viewmodel.calculateTotalAmount()}",)),
                    )
                  ],
                );     }
          )

      ),

    );
  }
}
