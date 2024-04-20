

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/dummyJson.dart';
import 'package:my_flutter/utils/responsive.dart';

import '../../../widgets/big_text.dart';
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
      body: Responsive(
        mobile: getWidget(1),
        tablet: getWidget(2),
        desktop: getWidget(3),
      ),
    );
  }

  Widget getWidget(type){
  return  Container(
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
                  BigText(text: "Table",color: Colors.white,size: 23,),
                  Container()

                ],
              ),
            ),
            Image.asset("assets/images/table.png",height: 100,),
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
                    children:DummyJson.allTable.data?.map((e) => RunningGridItems(e)).toList()??[])),


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
      return 7;
    }

  }
}
