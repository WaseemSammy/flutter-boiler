import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:my_flutter/models/food_category_response.dart';

import '../../../api/Status.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/dummyJson.dart';
import '../../../models/cartItems.dart';
import '../../../routes/routes.dart';
import '../../../screens/mobile/category/ui/category_items.dart';
import '../../../screens/mobile/dashboard/viewmodels/dashboard_view_model.dart';
import '../../../screens/mobile/orders/ui/widgets/bottem_sheet_item_add.dart';
import '../../../screens/mobile/orders/viewmodel/table_order_viewmodel.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/addItem_dialog.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/big_text_for_heading.dart';
import '../../../widgets/bottem_price_and_add.dart';
import '../../../widgets/common_order_widget.dart';

class WebOrderScreen extends StatefulWidget {
  final int screenType;
  const WebOrderScreen(this.screenType,{super.key});

  @override
  State<WebOrderScreen> createState() => _WebOrderScreenState();
}

class _WebOrderScreenState extends State<WebOrderScreen> {
  final _viewModel = Get.put(TableOrderViewModel());
  String dropdownvalue = 'Floor 1';
  List<CategoryData>? _searchedItems = [];
  var items = [
    'All',
    'Non veg',
    'Veg',
  ];
  List<bool> isSelected = [true, false, false];

  selectedMenu(Orders order, int count, int type) {
    if (kDebugMode) {
      print("$order $count $type");
    }
    _viewModel.add(order, count, type == 1 ? "Half" : "Full");
  }

  @override
  void initState() {
    _searchedItems = DummyJson.dummyCategory.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: getView(1),
      tablet: getView(2),
      desktop: getView(3),
    );
  }

  Widget getView(type) {
    return GetBuilder<DashboardViewModel>(builder: (viewmodel) {
      switch (viewmodel.dashboardResponse.status) {
        case Status.LOADING:
          return Container();
        case Status.COMPLETED:
          return Container(
            padding: const EdgeInsets.all(10),
            color: ColorConstants.AppBackgroundColor,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                type != 1
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: getSearchView()),
                          Expanded(child: getFilter())
                        ],
                      )
                    : Column(
                        children: [getSearchView(), getFilter()],
                      ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(5),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: DummyJson.dummyCategory.data!
                                .map((e) => Container(
                                      margin: const EdgeInsets.all(5),
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("${e.categoryName}"),
                                      ),
                                    ))
                                .toList()),
                      ),
                      Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: getGridViewCount(type),
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                              ),
                              itemCount:
                                  DummyJson.dummyCategory.data?[0].menu?.length,
                              itemBuilder: (context, index) {
                                return getGridView(DummyJson
                                    .dummyCategory.data![0].menu![index],type);
                              }))
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
    });
  }

  confirmOrder() {
    // Get.toNamed(RouteClass.getOrderConfirm(),arguments: data);
  }

  Widget getGridView(Orders e, type) {
    return InkWell(
        onTap: () {
          /* showModalBottomSheet(
         context: context,
         // color is applied to main screen when modal bottom screen is displayed
         //background color for modal bottom screen
         backgroundColor: Colors.yellow,
         //elevates modal bottom screen
         elevation: 10,
         // gives rounded corner to modal bottom screen
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10.0),
         ),
         builder: (BuildContext context) {
           // UDE : SizedBox instead of Container for whitespaces
           return Scaffold(body: BottemSheetItemAddPopup(e,selectedMenu));
         },
       );*/
          if(type == 1) {
            Get.bottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),

                const AdditemDialog()
            );
          }else{
            Get.dialog(
              const AdditemDialog()
            );
          }
        },
        child: SizedBox(
          width: 100  ,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 2.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                    child: Image.asset(

                      'assets/images/biryani_image.webp',
                      // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BigText(
                      text: 'Chicken Biryani',
                    ),
                    BigText(
                      text: '120.00\$',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget getSearchView() {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onChanged: (value) => {}, //filter(value),
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            labelText: "Search items",
            labelStyle: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget getFilter() {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      fillColor: Colors.red,
      color: Colors.black,
      borderColor: Colors.grey,
      borderRadius: BorderRadius.circular(8),
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('All'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(Icons.restaurant, size: 18),
              SizedBox(width: 4),
              Text('Non Veg'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(Icons.restaurant_menu, size: 18),
              SizedBox(width: 4),
              Text('Veg'),
            ],
          ),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            if (i == index) {
              isSelected[i] = true;
            } else {
              isSelected[i] = false;
            }
          }
        });
      },
    );
  }

  getGridViewCount(type) {
    if (widget.screenType == 1) {
      return 2;
    } else if (widget.screenType == 2) {
      return 3;
    } else {
      return 5;
    }
  }
}
