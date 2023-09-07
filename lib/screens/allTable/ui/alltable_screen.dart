import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:my_flutter/constants/dummyJson.dart';

import '../../../widgets/big_text.dart';
import '../../dashboard/widgets/your_order.dart';
import '../widgets/running_items.dart';

class AllTableScreen extends StatefulWidget {
  const AllTableScreen({Key? key}) : super(key: key);

  @override
  State<AllTableScreen> createState() => _RunningOrdersState();
}

class _RunningOrdersState extends State<AllTableScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.purple,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50,left: 20,right: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.25,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)),
                      BigText(text: "Table",color: Colors.white,size: 23,),
                      Container()

                    ],
                  ),
                  LottieBuilder.asset("assets/animations/running.json",height: 100,)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))

                ),
                child: GridView.count(crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children:DummyJson.allTable.data?.map((e) => RunningGridItems(e)).toList()??[]))
                ),


          ],
        ),),
    );
  }
}
