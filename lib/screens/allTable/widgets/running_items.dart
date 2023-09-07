import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/small_text.dart';

class RunningGridItems extends StatefulWidget {
  final Data data;
  const RunningGridItems(this.data, {Key? key}) : super(key: key);

  @override
  State<RunningGridItems> createState() => _RunningGridItemsState();
}

class _RunningGridItemsState extends State<RunningGridItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteClass.orderScreen,arguments: widget.data);
      },
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(5),

           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               // top items
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Icon(Icons.people_alt_outlined,color: Colors.deepOrangeAccent,
                   size: 30,),
                   BigText(text: "T${widget.data.tableNo}"
                   ,size: 25,)
                 ],
               ),
               BigText(text: "${widget.data.noOfPerson} Persons",size: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SmallText(text: "10:10",color: Colors.grey,),
                   SmallText(text: "10 minutes",color: Colors.grey,)
                 ],
               )
             ],
           ),
        ),
      ),
    );
  }
}
