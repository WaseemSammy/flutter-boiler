import 'package:flutter/material.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/models/food_category_response.dart';
import 'package:my_flutter/models/running_order_response.dart';

import 'package:my_flutter/utils/responsive.dart';
import '../constants/dummyJson.dart';
import '../screens/mobile/category/ui/category_items.dart';
import '../screens/mobile/menu/ui/menu_items.dart';



class CommonOrderWidget extends StatefulWidget {
  final int viewType;
  final Function selectedCategory;
  final Function selectedMenu;
  final CategoryData? categoryData;
  final Data? data;
  const CommonOrderWidget(this.viewType,  this.selectedCategory, this.selectedMenu, this.categoryData, this.data, {Key? key}) : super(key: key);

  @override
  State<CommonOrderWidget> createState() => _CommonOrderWidgetState();
}


class _CommonOrderWidgetState extends State<CommonOrderWidget> {


  List<Orders>? _searchedItems = [];

  @override
  void didUpdateWidget(covariant CommonOrderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

  }

  @override
  void initState() {
    super.initState();
    _searchedItems = widget.categoryData?.menu;
  }
  @override
  Widget build(BuildContext context) {
    return  Responsive(
        mobile:  Container(
          child: getWidget(widget.viewType,1),
        ), 
        tablet:  Container(
          child: getWidget(widget.viewType,2),
        ),
        desktop:  Container(
          child: getWidget(widget.viewType,3),
        ))
     ;
  }
  getWidget(int type,screenType){
    if(type == 0){
      return Container(
          padding: const EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height/2,
          decoration: const BoxDecoration(

              borderRadius: BorderRadius.zero
          ),
          child:  MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: GridView.count(crossAxisCount: getGridViewCount(screenType),
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children:DummyJson.dummyCategory.data?.map((e) => CategoryItem(e,widget.selectedMenu)).toList()??[]),
          )
      );
    }
    else{
      return Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(

              borderRadius: BorderRadius.zero
          ),

          child:  Column(
            children: [

              Expanded(
                child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.separated(
                      shrinkWrap: true,
                        itemBuilder: (context, index) {
                      return MenuItems(_searchedItems?[index],widget.data,true,widget.selectedMenu);
                    }, separatorBuilder: (context, index) {
                      return const Divider(height: 0.5,color: Colors.grey,);
                    }, itemCount: _searchedItems?.length??0)
                ),
              )
            ],
          )
      );
    }
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
  void filter(String searchText) {
    print("object ${widget.categoryData?.menu}");
    List<Orders>? results = [];
    if(searchText.isEmpty) {
      results = widget.categoryData?.menu;
    } else {
      results = widget.categoryData?.menu?.where((element) => element.itemName?.toLowerCase().contains(searchText.toLowerCase()) == true).toList();
    }

    print(" result $results");
    setState(() {
      _searchedItems = results;
    });
  }

}
