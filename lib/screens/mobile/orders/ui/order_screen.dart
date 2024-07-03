import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:my_flutter/api/Status.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/constants/dummyJson.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/routes/routes.dart';
import 'package:my_flutter/screens/mobile/common/common_app_bar.dart';
import 'package:my_flutter/screens/mobile/dashboard/viewmodels/dashboard_view_model.dart';

import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/widgets/big_text_for_heading.dart';
import 'package:my_flutter/widgets/bottem_price_and_add.dart';
import 'package:my_flutter/widgets/common_order_widget.dart';

import '../../../../models/food_category_response.dart';
import '../viewmodel/table_order_viewmodel.dart';




class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Data? data;
  String? numberCustomer;
  final _viewModel  = Get.put(TableOrderViewModel());
  String dropdownvalue = 'Floor 1';
  var items = [
    'Floor 1',
    'Floor 2',
    'Floor 3',
  ];

  @override
  void initState() {
    String id = Get.parameters['id'] ?? '';
    numberCustomer = Get.parameters['nc'] ?? '';
    print(id);
    data =DummyJson.allTable.data?.firstWhere((element) => element.tableId.toString() == id);
    items = DummyJson.allTable.data!.map((e) => "${e.tableNo}").toList();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  int viewType = 1;
  CategoryData? categoryData;



  selectedMenu(Orders order,int count, int type){
    if (kDebugMode) {
      print("$order $count $type");
    }
    _viewModel.add(order, count, type==1 ?"Half" : "Full");
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

    return Responsive(
      mobile: getWidget(1),
      tablet: getWidget(2),
      desktop: getWidget(3),
    );
  }

  Widget getWidget(type){
   return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppBar("",true),
      ),
      body: GetBuilder<DashboardViewModel>(
        builder: (viewmodel){
          switch(viewmodel.dashboardResponse.status){
            case Status.LOADING:
              return Container();
            case Status.COMPLETED:
              return Container(
                color: ColorConstants.AppBackgroundColor,
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            BigTextForHeading(text: "Floor",color: Colors.black,size: 16),
                            SizedBox(

                              width: 100,
                              child: DropdownButtonHideUnderline(
                                child: GFDropdown(
                                  isExpanded: true,
                                  padding: const EdgeInsets.all(10),
                                  borderRadius: BorderRadius.circular(5),
                                  border: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  dropdownButtonColor: Colors.white,

                                  // Initial Value
                                  value: items[0],
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),


                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            BigTextForHeading(text: "Table",color: Colors.black,size: 16),
                            SizedBox(

                              width: 100,
                              child: DropdownButtonHideUnderline(
                                child: GFDropdown(
                                  isExpanded: true,
                                  padding: const EdgeInsets.all(10),
                                  borderRadius: BorderRadius.circular(5),
                                  border: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  dropdownButtonColor: Colors.white,

                                  // Initial Value
                                  value: items[0],
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),


                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        onChanged: (value) => {},//filter(value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                            border:  OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),

                            ),
                            labelText: "Search items",
                            labelStyle: TextStyle(
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height:50,
                            padding: const EdgeInsets.all(5),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: DummyJson.dummyCategory.data!.map((e) =>Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.black)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("${e.categoryName}"),
                                  ),
                                )
                                ).toList()
                            ),
                          ),
                          Flexible(
                              child:CommonOrderWidget(1, selectedCategory, selectedMenu, DummyJson.dummyCategory.data?[0], data))
                        ],
                      ),
                    ),

                  ],
                ),


                /*  Container(
                padding: const EdgeInsets.all(10),
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
                child: CommonOrderWidget(viewType,selectedCategory,selectedMenu, categoryData,data))*/


              );
            default:
              return Container();
          }


        }
      ),
      bottomNavigationBar: BottemOrderScreen(confirmOrder),
    );

  }


}
