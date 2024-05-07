

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/widgets/big_text.dart';

import '../../../widgets/big_text_for_heading.dart';

class CommonAppBar extends StatefulWidget {
  final String appTitle;
  const CommonAppBar(this.appTitle, {super.key});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: ColorConstants.AppBackgroundColor,
      title: Center(child: BigTextForHeading(text: widget.appTitle,size: 22,color: Colors.black,)),
      leading: Visibility(
        visible: widget.appTitle == "" || widget.appTitle == "TABLES"? true :false,
        child: IconButton(
          icon: Icon(Icons.arrow_back,size: 28),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Image.asset("assets/icons/menu.png",width: 30,
      height: 30,))
      ]
    );

      Container(
      color: ColorConstants.AppBackgroundColor,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(visible: false,
              child: Icon(Icons.arrow_back,size: 28,color: Colors.black)
          ),
          Center(child: BigTextForHeading(text: "ORDERS",size: 22,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Image.asset("assets/icons/menu.png",width: 30,
            height: 30,)),
        ],
        
      ),
    );
  }
}
