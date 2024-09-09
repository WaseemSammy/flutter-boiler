import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/screens/newDesign/style.dart';

import '../../../constants/app_colors.dart';

class CategoryMenuItem extends StatefulWidget {
  final  Orders? data;
  final  Function(Orders? data) onPressed;
  const CategoryMenuItem({super.key,this.data, required  this.onPressed});

  @override
  State<CategoryMenuItem> createState() => _CategoryMenuItemState();
}

class _CategoryMenuItemState extends State<CategoryMenuItem> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){widget.onPressed(widget.data);},
      child: Container(
        color: Colors.deepPurple[900],
        child:  Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        PrimaryText(
                            text: widget.data?.itemName??"",
                            color: AppColors.white,
                            size: 10,
                            fontWeight: FontWeight.w700
                        ),

                        PrimaryText(
                            text: "Rs ${widget.data?.itemPrice}",
                            color: AppColors.white,
                            size: 9,
                            fontWeight: FontWeight.w300
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black26,
                      child: IconButton(
                        padding: EdgeInsets.all(2),
                          constraints: BoxConstraints(),
                          iconSize : 15 ,onPressed: () {}, icon: const Icon(Icons.add,color: AppColors.white,))),
                     const PrimaryText(text: "0",color: AppColors.white,size: 12,
                       fontWeight: FontWeight.w700,
                     ),
                  Container(
                      color: Colors.black26,
                      child: IconButton(
                          padding: EdgeInsets.all(2),
                          constraints: BoxConstraints(),
                          iconSize : 15 ,onPressed: () {}, icon: const Icon(Icons.remove,color: AppColors.white,))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
