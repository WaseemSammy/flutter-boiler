import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/constants/dummyJson.dart';
import 'package:my_flutter/models/dashboard_response.dart';
import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/widgets/big_text_for_heading.dart';
import 'package:my_flutter/widgets/small_text.dart';

import '../../../../widgets/big_text.dart';

class ListOrders extends StatefulWidget {
  final CurrentOrders? currentOrders;
  const ListOrders(this.currentOrders, {super.key});

  @override
  State<ListOrders> createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {
  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: getUI(1), tablet:  getUI(2), desktop:  getUI(3));
  }
  Widget getUI(type){
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  SmallText(text: "${widget.currentOrders?.restaurantArea}",color: Colors.grey.shade400,),
                  SizedBox(width: 10,),
                  Expanded(child: Divider(height: .2, color: Colors.grey.shade200,)),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigTextForHeading(text: "Table No",color: Colors.black,size: type==1 ? 14 : 20,),
                BigTextForHeading(text: "Time",color: Colors.black,size: type==1 ? 14 : 20,),
                BigTextForHeading(text: "Pending Items",color: Colors.black,size: type==1 ? 14 : 20,),
                Container()
              ],
            ),
            ...?widget.currentOrders?.orders?.map((product) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          color:Colors.white,
                          child: Wrap(
                            spacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset("assets/icons/table.png",width: 20,height: 20,),
                              SmallText(text: "8")
                            ],),
                        ),
                        SmallText(text: "12:00",),
                        SmallText(text: "12:00",),
                        Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.grey,)
                      ],
                    ),
                  ),
                  Divider(height: .2,color: Colors.grey.shade200,)
                ],
              );
            })
          ]
      ),
    );
  }
}
