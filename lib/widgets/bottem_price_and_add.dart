import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/widgets/big_text.dart';

import '../screens/orders/viewmodel/table_order_viewmodel.dart';
import 'big_text_center.dart';


class BottemOrderScreen extends StatefulWidget {
  final Function callback;
  const BottemOrderScreen(this.callback,{Key? key}) : super(key: key);

  @override
  State<BottemOrderScreen> createState() => _BottemOrderScreenState();
}

class _BottemOrderScreenState extends State<BottemOrderScreen> {

  final _viewModel  = Get.put(TableOrderViewModel());

  @override
  Widget build(BuildContext context) {
    return
      Obx(() {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: BigTextCenter(text: "Rs ${_viewModel.total?.value}"
                    ,size: 20,),
                ),
              ),
              GestureDetector(
                onTap: (){
                  widget.callback();
                },
                child: Container(
                  width: 150,
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children:[
                        BigTextCenter(text:"Confirm"
                          ,color: Colors.white,
                          size: 20,),
                        Icon(Icons.arrow_forward,size: 25,color: Colors.white,)
                      ]
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });

  }
}

