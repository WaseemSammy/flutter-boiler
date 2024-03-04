import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/dashboard/widgets/your_order.dart';
import 'package:my_flutter/screens/running/ui/running_screen.dart';
import 'package:my_flutter/utils/responsive.dart';

import '../../../widgets/big_text.dart';
import '../../orders/viewmodel/table_order_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return GetX<TableOrderViewModel>(
      init: TableOrderViewModel(),
      builder: (controller) => Responsive(
        mobile: getUi(controller),
        tablet: getUi(controller),
        desktop: getUi(controller),
      ),
    );

  }
  Widget getUi(TableOrderViewModel controller){
     return Container(
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:40,left: 20,right: 20,bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  InkWell(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Icon(Icons.menu,size: 20,color: Colors.white,))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
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
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
              margin: EdgeInsets.only(left: 20,right: 20),
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
                      Image.asset("assets/icons/table.png",width: 50,height: 50,),
                      BigText(text: "Tables",
                        size: 20,)
                    ],),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteClass.getAllTable());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellowAccent[200],
                      ),
                      child: BigText(text: "5/15",size: 20,),
                    ),
                  )
        
                ],
              ),
            ),
            SizedBox(height: 30,),
            //Bottem view
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigText(text: "Table No"),
                  BigText(text: "Starting Time"),
                  BigText(text: "Total"),
                  BigText(text: ""),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Divider(
              color: Colors.black,
              height: 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                    height: 0.5,
                  ),
                  itemCount: controller.cartItemData.length,
                  itemBuilder: (context, index) => YourOrder(),
                ),
              ),
            )
          ],
        ),
      ),);
  }
}
