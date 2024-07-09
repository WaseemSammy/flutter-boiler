

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/constants/color_constants.dart';

import '../../../widgets/big_text_for_heading.dart';

class CommonAppBar extends StatefulWidget {
  final String appTitle;
  final bool isBack;
  const CommonAppBar(this.appTitle, this.isBack, {super.key});

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
        visible: widget.isBack? true :false,
        child: IconButton(
          icon: const Icon(Icons.arrow_back,size: 28),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      actions: [
        IconButton(onPressed: (){

        }, icon: Image.asset("assets/icons/menu.png",width: 30,
      height: 30,))
      ]
    );

      Container(
      color: ColorConstants.AppBackgroundColor,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Visibility(visible: false,
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
