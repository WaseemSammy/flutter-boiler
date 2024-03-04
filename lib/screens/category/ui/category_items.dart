import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_flutter/models/food_category_response.dart';

import '../../../routes/routes.dart';
import '../../../widgets/big_text.dart';

class CategoryItem extends StatefulWidget {
  final CategoryData categoryData;
  final Function callback;
  const CategoryItem(this.categoryData, this.callback, {Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
       // Get.toNamed(RouteClass.orderScreen);
        widget.callback(widget.categoryData);
      },
      child: Card(
        elevation: 10,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // top item
              Image.asset("assets/icons/dining.png",width: 50,height: 50,),
              BigText(text: widget.categoryData.categoryName??"",size: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
