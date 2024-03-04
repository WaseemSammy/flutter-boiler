import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/screens/orders/viewmodel/table_order_viewmodel.dart';

import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';

class MenuItems extends StatefulWidget {
  final Orders? menu;
  final Data? data;
  final bool visibility;
  const MenuItems(this.menu, this.data, this.visibility, {Key? key}) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {

  @override
  void dispose() {
    super.dispose();
  }

  bool ref = false;

  final _viewModel  = Get.put(TableOrderViewModel());

  refresh(){
    setState(() {
      if(ref==true){
        ref = false;
      }else{
        ref = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Menu Item build");
    int Itemcount = _viewModel.getItemCountByTableIdAndItems(widget.data,widget.menu?.itemId);
    return  Container(
      padding: EdgeInsets.all(10),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Wrap (
             spacing: 10,
             crossAxisAlignment: WrapCrossAlignment.center,
             children: [
               DottedBorder(
                 color: Colors.grey,
                   child: Container(
                 height: 30,
                 width: 30,

               )),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   BigText(text: widget.menu?.itemName??"", size: 18,color: Colors.black54,),
                   SizedBox(height: 5,),
                   SmallText(text: widget.visibility == true ? "${widget.menu?.itemPrice}" : "${widget.menu?.count}", size: 12,
                   color: Colors.grey,),
                 ],
               )

             ],),
           Visibility(
             visible: widget.visibility,
             child: Wrap (
               spacing: 7,
               crossAxisAlignment: WrapCrossAlignment.center,
               children: [
                 InkWell(
                   onTap: (){
                      final copyMenu = Orders.clone(widget.menu);
                     _viewModel.remove(copyMenu, widget.data);
                      refresh();

                   },
                   child: CircleAvatar(
                     maxRadius: 15,
                     backgroundColor: Colors.black,
                     child: Icon(Icons.remove,color: Colors.white,
                       size: 20,),
                   ),
                 ),
                 BigText(text: "${Itemcount}"),
                 InkWell(
                   onTap: (){
                     final copyMenu = Orders.clone(widget.menu);
                     _viewModel.add(copyMenu, widget.data);
                     refresh();


                   },
                   child: CircleAvatar(
                     maxRadius: 15,
                     backgroundColor: Colors.black,
                     child: Icon(Icons.add,color: Colors.white,
                       size: 20,),
                   ),
                 )
                 ,
               ],),
           ),
         ],
       ),
    );
  }
}
