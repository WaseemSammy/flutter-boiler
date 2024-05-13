import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/web/web_dashboard/widgets/dashboard_orders.dart';
import 'package:my_flutter/widgets/big_text.dart';

class WebHomeScreem extends StatefulWidget {
  const WebHomeScreem({super.key});

  @override
  State<WebHomeScreem> createState() => _WebHomeScreemState();
}

class _WebHomeScreemState extends State<WebHomeScreem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset("assets/icons/dining.png",width: 50,height: 50,),
                    BigText(text: "Running Orders",
                      size: 20,)
                  ],),
                GestureDetector(
                  onTap: ()=> Get.toNamed(RouteClass.getRunningOrders()),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellowAccent[200],
                    ),
                    child: BigText(text: "5",size: 20,),
                  ),
                )

              ],
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BigText(text: "Type",color: Colors.black,),
                BigText(text: "Order Number",color: Colors.black),
                BigText(text: "Amount",color: Colors.black),
                BigText(text: "Status",color: Colors.black),
                BigText(text: "Time",color: Colors.black),
                Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: BigText(text: "Print",color: Colors.black,)),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30,
                ),

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index) => Container(
              color: (index % 2 == 0) ? Colors.grey.shade100 : Colors.white,
              child: const DashboardOrders(),
            )
              ,itemCount: 10,
            shrinkWrap: true,),
          )
        ],
      ),
    );
  }
}
