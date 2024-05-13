import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/constants/color_constants.dart';
import 'package:my_flutter/models/cartItems.dart';

import '../../../../../widgets/big_text.dart';
import '../../../../../widgets/big_text_for_heading.dart';

class BottemSheetItemAddPopup extends StatefulWidget {
  final Orders? menu;
  const BottemSheetItemAddPopup(this.menu, {super.key});

  @override
  State<BottemSheetItemAddPopup> createState() => _BottemSheetItemAddPopupState();
}

class _BottemSheetItemAddPopupState extends State<BottemSheetItemAddPopup> {

  int count = 0;
  int type = 0;

  @override
  Widget build(BuildContext context) {
    print("Build $count");
    return SizedBox(
      height: 500,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly,
          children: <Widget>[
            Center(
                child: BigText(
                  text: "${widget.menu?.itemName}",
                  size: 20,
                  color: Colors.black,)
            ), Center(
                child: Image.asset(
                  "assets/images/biryani_image.webp",
                  width: 250, height: 200,)
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center,
                children: [
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        type = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: type==1? Colors.black : ColorConstants.AppBackgroundColor,
                          borderRadius: BorderRadius
                              .circular(50),
                          border: Border.all(
                              color: Colors.black)),
                      child: Align(
                        alignment: Alignment.center,
                        child: BigTextForHeading(
                          text: "HALF",
                          color: type==1? Colors.white : Colors.black,),
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        type = 2;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: type==2? Colors.black : ColorConstants.AppBackgroundColor,
                          borderRadius: BorderRadius
                              .circular(50),
                          border: Border.all(
                              color: Colors.black)),
                      child: Align(
                        alignment: Alignment.center,
                        child: BigTextForHeading(
                          text: "FULL",
                          color:  type==2? Colors.white : Colors.black,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Wrap(
                spacing: 7,
                crossAxisAlignment: WrapCrossAlignment
                    .center,
                children: [
                  InkWell(
                    onTap: () {
                      /*final copyMenu = Orders.clone(
                          widget.menu);
                      _viewModel.remove(
                          copyMenu, widget.data);
                      refresh();*/
                      if(count>0){
                        setState(() {
                          count--;
                        });

                      }

                    },
                    child: const CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.remove,
                        color: Colors.white,
                        size: 20,),
                    ),
                  ),
                  BigText(text: "$count"),
                  InkWell(
                    onTap: () {

                      print("$count");
                      setState(() {
                        count++;
                      });

                      /*  final copyMenu = Orders.clone(
                          widget.menu);
                      _viewModel.add(
                          copyMenu, widget.data);
                      refresh();*/
                    },
                    child: const CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.add,
                        color: Colors.white,
                        size: 20,),
                    ),
                  )
                ],),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  //Get.toNamed(RouteClass.alltable);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(
                      horizontal: 50, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius
                          .circular(20)
                  ),
                  child: BigText(text: "Add",
                    color: Colors.white,
                    size: 20,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
