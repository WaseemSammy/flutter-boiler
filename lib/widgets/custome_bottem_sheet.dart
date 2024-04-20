import 'package:flutter/material.dart';
import 'package:my_flutter/models/running_order_response.dart';

import '../models/food_category_response.dart';
import 'big_text.dart';
import 'common_order_widget.dart';

class CustomeBottemSheet extends StatefulWidget {
  final Data? data;
  final Function? refres;
  const CustomeBottemSheet(this.data,  this.refres, {Key? key}) : super(key: key);

  @override
  State<CustomeBottemSheet> createState() => _CustomeBottemSheetState();
}

class _CustomeBottemSheetState extends State<CustomeBottemSheet> {

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
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
                        child: const Icon(Icons.arrow_back,size: 23,color: Colors.black,)),
                  ),
                  BigText(text: viewType==0?"Category List":"Menu List",color: Colors.black,size: 23,),
                  Container()],
              )
          ),
          CommonOrderWidget(viewType,selectedCategory,selectedMenu, categoryData,widget.data)
        ],
      ),
    );
  }
}
