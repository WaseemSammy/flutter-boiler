import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../screens/mobile/orders/viewmodel/table_order_viewmodel.dart';
import 'big_text_center.dart';


class BottemOrderScreen extends StatefulWidget {
  final Function callback;
  const BottemOrderScreen(this.callback,{super.key});

  @override
  State<BottemOrderScreen> createState() => _BottemOrderScreenState();
}

class _BottemOrderScreenState extends State<BottemOrderScreen> {

  final _viewModel  = Get.put(TableOrderViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableOrderViewModel>(
      init: TableOrderViewModel(),
        builder: (viewmodel){
      return Visibility(
        visible: viewmodel.getTotalCartItemCount()>0 ? true:false,
        child: GestureDetector(
          onTap: (){
            widget.callback();
          },
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                  alignment: WrapAlignment.center,
                  children:[
                    BigTextCenter(text:"${viewmodel.getTotalCartItemCount()} item added"
                      ,color: Colors.white,
                      size: 15,),
                    const Icon(Icons.arrow_forward,size: 25,color: Colors.white,)
                  ]
              ),
            ),
          ),
        ),
      );
    });
      

  }
}

