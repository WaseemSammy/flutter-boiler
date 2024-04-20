import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/utils/utils_helper.dart';
import 'package:my_flutter/widgets/big_text.dart';
import 'package:my_flutter/widgets/small_text.dart';

class RunningGridItems extends StatefulWidget {

  final Data data;
  const RunningGridItems(this.data, {Key? key}) : super(key: key);

  @override
  State<RunningGridItems> createState() => _RunningGridItemsState();
}

class _RunningGridItemsState extends State<RunningGridItems> {

  int selectedPerson =0;

  void selectPerson(number){
   // print("Selected $number");
    Navigator.pop(context, "");
    Get.toNamed("${RouteClass.orderScreen}${widget.data.tableId}/$number");
  }


  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return GestureDetector(
      onTap: (){
        print(widget.data);
        //Get.rootDelegate.toNamed(RouteClass.orderScreen, arguments: 'test_data');
        Utils.intence.showCustomerDialog(context,selectPerson);
       // Get.toNamed("${RouteClass.orderScreen}${widget.data.tableId}");
      },
      child: Card(
        elevation: 10,
        color: Colors.white,
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
