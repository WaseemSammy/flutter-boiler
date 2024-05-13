import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/screens/mobile/orders/ui/widgets/bottem_sheet_item_add.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/big_text_for_heading.dart';
import 'package:my_flutter/widgets/small_text.dart';

import '../../../../routes/routes.dart';
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

  add(data){

  }

  remove(data){
    final copyMenu = Orders.clone(
        widget.menu);
    _viewModel.remove(
        copyMenu, widget.data);
  }

  @override
  Widget build(BuildContext context) {


   // int Itemcount = _viewModel.getItemCountByTableIdAndItems(widget.data,widget.menu?.itemId);
    return  Container(
      padding: const EdgeInsets.all(10),
       child: InkWell(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Wrap(
               alignment: WrapAlignment.start,
                 children:[
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8.0),
                 child: Image.asset(
                   "assets/images/biryani_image.webp",
                   width: 100, height: 100,fit: BoxFit.fill,),
               ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: Column(

                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         BigText(text: widget.menu?.itemName??"", size: 16,color: Colors.black54,),
                         InkWell(
                           onTap: (){
                             showModalBottomSheet(
                               context: context,
                               // color is applied to main screen when modal bottom screen is displayed
                               //background color for modal bottom screen
                               backgroundColor: Colors.yellow,
                               //elevates modal bottom screen
                               elevation: 10,
                               // gives rounded corner to modal bottom screen
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               builder: (BuildContext context) {
                                 // UDE : SizedBox instead of Container for whitespaces
                                 return BottemSheetItemAddPopup(widget.menu);
                               },
                             );
                           },
                           child: Container(
                             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.all(Radius.circular(20))
                             ),
                             child: BigText(text: "Add",
                               color: Colors.white,),
                           ),
                         )
                       ],
                     ),
                   )
                    ]
             ),
             SmallText(text: widget.visibility == true ? "${widget.menu?.itemPrice}" : "${widget.menu?.count}", size: 16,
               color: Colors.black54,),

             /*Expanded(
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
             )*/
            /* if(Itemcount == 0)
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
                else*/

           ],
         ),
       ),
    );
  }


}
