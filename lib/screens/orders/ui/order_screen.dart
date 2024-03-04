import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/menu/ui/menu_items.dart';
import 'package:my_flutter/screens/orders/viewmodel/table_order_viewmodel.dart';
import 'package:my_flutter/screens/running/widgets/running_items.dart';
import 'package:my_flutter/widgets/common_order_widget.dart';

import '../../../constants/dummyJson.dart';
import '../../../models/food_category_response.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/bottem_price_and_add.dart';
import '../../category/ui/category_items.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Data? data;
  final _viewModel  = Get.put(TableOrderViewModel());
  @override
  void initState() {
    data = Get.arguments;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  int viewType = 0;
  CategoryData? categoryData;



  selectedMenu(CategoryData? data){
    categoryData = data;
    setState(() {
      viewType = 1;
    });
  }

  selectedCategory(){
    categoryData = null;
    setState(() {
      viewType = 0;
    });
  }

  confirmOrder(){
    Get.toNamed(RouteClass.getOrderConfirm(),arguments: data);
  }

  @override
  Widget build(BuildContext context) {

    _viewModel.calCulateTotal(data);
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top:40,left: 20,right: 20,bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    InkWell(
                        onTap: () {
                         Get.back();
                        },
                        child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)),
                    BigText(text: "Select Menu",color: Colors.white,size: 23,),
                    Container()
                  ],

                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap (
                      spacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset("assets/icons/table.png",width: 40,height: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Table No.", size: 16,),
                            BigText(text: "${data?.tableNo}", size: 27,),
                          ],
                        )

                      ],),
                    Wrap (
                      spacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.people_alt_outlined,color: Colors.deepOrangeAccent,
                          size: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Customers.", size: 16,),
                            BigText(text:  "${data?.noOfPerson}", size: 27,),
                          ],
                        )

                      ],),


                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: viewType==1?true:false,
                        child: InkWell(
                            onTap: () {
                              selectedCategory();
                            },
                            child: Icon(Icons.arrow_back,size: 23,color: Colors.black,)),
                      ),
                      BigText(text: viewType==0?"Category List":"Menu List",color: Colors.black,size: 23,),
                      Container()],
                  )
              ),
              SizedBox(
                height: 500,
                  child: CommonOrderWidget(viewType,selectedCategory,selectedMenu, categoryData,data))

            ],
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
          visible: viewType==1 ? true : false,
          child: BottemOrderScreen(confirmOrder)),
    );
  }


}
