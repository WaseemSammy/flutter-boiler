import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/small_text.dart';


class RunningGridItems extends StatefulWidget {
  final Data data;
  const RunningGridItems(this.data, {super.key});

  @override
  State<RunningGridItems> createState() => _RunningGridItemsState();
}

class _RunningGridItemsState extends State<RunningGridItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(widget.data);
       // Utils.intence.showCustomerDialog(context);
         Get.toNamed("${RouteClass.orderScreen}${widget.data.tableId}");
      },
      child: Card(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(5),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               // top items
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Icon(Icons.people_alt_outlined,color: Colors.deepOrangeAccent,
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
