import 'package:flutter/material.dart';

import '../../../models/all_table_response.dart';
import '../../../utils/utils_helper.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';

class WebTableGrid extends StatefulWidget {
  final Tables data;
  final Function selectPerson;
  const WebTableGrid(this.data ,this.selectPerson,{super.key});

  @override
  State<WebTableGrid> createState() => _WebTableGridState();
}

class _WebTableGridState extends State<WebTableGrid> {



  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: (){
        //Get.rootDelegate.toNamed(RouteClass.orderScreen, arguments: 'test_data');
        Utils.intence.showCustomerDialog(context,widget.selectPerson);
        // Get.toNamed("${RouteClass.orderScreen}${widget.data.tableId}");
      },
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Container(

          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Utils.intence.getTableBackgroundColor(widget.data.tableStatusId),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // top items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.people_outline,color: Utils.intence.getTextAndIconColor(widget.data.tableStatusId),
                    size: 30,),
                  BigText(text: "${widget.data.diningTableName}",color: Utils.intence.getTextAndIconColor(widget.data.tableStatusId),
                  )
                ],
              ),
              BigText(text: "${widget.data.runningGuest} Guests",color: Utils.intence.getTextAndIconColor(widget.data.tableStatusId),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: "10:10",color: Utils.intence.getTextAndIconColor(widget.data.tableStatusId)),
                  SmallText(text: "10 minutes",color: Utils.intence.getTextAndIconColor(widget.data.tableStatusId))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
