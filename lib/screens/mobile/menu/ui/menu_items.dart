import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/small_text.dart';

import '../../orders/viewmodel/table_order_viewmodel.dart';


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
      padding: const EdgeInsets.all(10),
       child: InkWell(
         onTap: (){
          print("${widget.menu?.itemName}");
          Get.dialog(
            Dialog(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width*0.25,
                height: MediaQuery.of(context).size.height*0.55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15) )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LottieBuilder.asset("assets/animations/running.json",height: 100,),
                    BigText(text: "${widget.menu?.itemName}"),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: const BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15) )

                            ),

                            child: BigText(text: "Half")),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15) )

                            ),

                            child: BigText(text: "Full")),

                      ],
                    ),
                    Container(
                       width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15) )

                        ),

                        child: BigText(text: "ADD"),alignment: Alignment.center),
                  ],
                ),
              ),
            )
          );
         },
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Expanded(child: BigText(text: widget.menu?.itemName??"", size: 16,color: Colors.black54,)),
             Expanded(
               child: Center(
                 child: SmallText(text: widget.visibility == true ? "${widget.menu?.itemPrice}" : "${widget.menu?.count}", size: 12,
                   color: Colors.grey,),
               ),
             ),
             if(Itemcount == 0)
               Expanded(
                 child: Center(
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                       decoration: BoxDecoration(
                           color: Colors.black,
                           borderRadius: BorderRadius.all(Radius.circular(20))
                       ),
                       child: BigText(text: "Add",
                         color: Colors.white,),
                     )
                 ),
               )
                else
                  Expanded(
                  child: Center(
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
                          child: const CircleAvatar(
                            maxRadius: 15,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.remove,color: Colors.white,
                              size: 20,),
                          ),
                        ),
                        BigText(text: "$Itemcount"),
                        InkWell(
                          onTap: (){
                            final copyMenu = Orders.clone(widget.menu);
                            _viewModel.add(copyMenu, widget.data);
                            refresh();


                          },
                          child: const CircleAvatar(
                            maxRadius: 15,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.add,color: Colors.white,
                              size: 20,),
                          ),
                        )
                      ],),
                  ),
                )
           ],
         ),
       ),
    );
  }
}
