import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/models/food_category_response.dart';
import 'package:my_flutter/models/running_order_response.dart';
import 'package:my_flutter/screens/category/ui/category_items.dart';
import 'package:my_flutter/utils/responsive.dart';
import '../constants/dummyJson.dart';
import '../screens/menu/ui/menu_items.dart';


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
          padding: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height/2,
          decoration: BoxDecoration(
              color: Colors.white,
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
    }else{
      return Container(
          padding: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height/2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.zero
          ),
          child:  MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.separated(itemBuilder: (context, index) {
                return MenuItems(widget.categoryData?.menu?[index],widget.data,true);
              }, separatorBuilder: (context, index) {
                return Divider(height: 0.5,color: Colors.grey,);
              }, itemCount: widget.categoryData?.menu?.length??0)
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
}
