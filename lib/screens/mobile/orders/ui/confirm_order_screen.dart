import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/screens/mobile/orders/ui/widgets/order_summary.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/big_text_center.dart';
import 'package:my_flutter/widgets/custome_bottem_sheet.dart';
import 'package:my_flutter/widgets/small_text.dart';


import '../../common/common_app_bar.dart';
import '../../menu/ui/menu_items.dart';
import '../viewmodel/table_order_viewmodel.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}



class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {

  final _viewModel  = Get.put(TableOrderViewModel());
  int? ref = 0;

  Data? data;


  @override
  void initState() {
    data = Get.arguments;
   _viewModel.getCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void add(Orders cartItem ,int tableItem,String portionType){
      _viewModel.add(cartItem, tableItem, portionType);
    }

    void remove(String itemName,String portionType){
      _viewModel.removeFromCart(itemName, portionType);
    }

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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CommonAppBar("DETAIL",true),
      ),
       floatingActionButton: FloatingActionButton(
           elevation: 0.0,
           backgroundColor: Colors.deepOrangeAccent,
           onPressed: (){
             showModalBottomSheet(
               context: context,
               builder: (_) => CustomeBottemSheet(data,refresh),
             ).whenComplete(() {
                refresh();
             });
           },
           child: const Icon(Icons.add)
       ),
        body: Container(
        color: ColorConstants.AppBackgroundColor,
        child: GetBuilder<TableOrderViewModel>(
          init: TableOrderViewModel(),
          builder: (viewmodel){
            return  Column(
              children: [
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
        bottomNavigationBar: InkWell(

          child: Container(

            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: BigTextCenter(text: "Confirm Order",color: Colors.white,size: 20,),),
        ),
    );
  }
}
