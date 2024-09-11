

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_flutter/constants/dummyJson.dart';
import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/widgets/big_text.dart';

import '../widgets/running_items.dart';

class RunningOrders extends StatefulWidget {
  const RunningOrders({super.key});

  @override
  State<RunningOrders> createState() => _RunningOrdersState();
}

class _RunningOrdersState extends State<RunningOrders> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Responsive(
        mobile: getUI(1),
        tablet: getUI(2),
        desktop: getUI(3),
      ),
    );
  }

  Widget getUI(type){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.orange,
            Colors.purple,
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:40,left: 20,right: 20,bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back,size: 25,color: Colors.white,)),
                  BigText(text: "Running Table",color: Colors.white,size: 23,),
                  Container()

                ],
              ),
            ),
            LottieBuilder.asset("assets/animations/running.json",height: 100,),
            Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                ),
                child: GridView.count(crossAxisCount: getGridViewCount(type),
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:DummyJson.runningOrders.data?.map((e) => RunningGridItems(e)).toList()??[])),
          ],
        ),
      ),);
  }

  getGridViewCount(type){
    if(type == 1){
       return 3;
    }else if(type == 2){
      return 4;
    }else{
      return 8;
    }

  }
}
