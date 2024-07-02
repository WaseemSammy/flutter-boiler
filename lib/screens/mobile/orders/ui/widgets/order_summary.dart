import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/models/new_cart_Items.dart';
import 'package:my_flutter/widgets/small_text.dart';

import '../../../../../widgets/big_text.dart';

class OrderSummary extends StatefulWidget {
  final NewCartItems? cartItemData;
  final Function add;
  final  Function remove;
  const OrderSummary(this.cartItemData,  this.add,this.remove , {super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5,bottom: 5),

      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
       mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
                child: SmallText(text: "${widget.cartItemData?.quantity} x ${widget.cartItemData?.itemName} (${widget.cartItemData?.ItemType})")),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: SmallText(text: "${getPrice(widget.cartItemData)}" )),
          ),
          Expanded(child: Wrap(
            spacing: 7,
            crossAxisAlignment: WrapCrossAlignment
                .center,
            children: [
              InkWell(
                onTap: () {
                  widget.remove(widget.cartItemData?.itemName,widget.cartItemData?.ItemType);
                },
                child: const CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.remove,
                    color: Colors.white,
                    size: 15,),
                ),
              ),
              BigText(text: "${widget.cartItemData?.quantity}"),
              InkWell(
                onTap: () {
                  int qty = widget.cartItemData?.quantity??1;
                  String? type = widget.cartItemData?.ItemType;
                  widget.add(widget.cartItemData, qty--,type);
                },
                child: const CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.add,
                    color: Colors.white,
                    size: 15,),
                ),
              )
            ],)),
          Expanded(
            child: Align(alignment: Alignment.centerRight,
                child: SmallText(text: "${getTotal(widget.cartItemData)}")),
          ),
        ],
      ),
    );
  }

  double? getPrice(NewCartItems? cartItemData){
    return cartItemData?.ItemType == "Half" ? cartItemData?.priceHalf: cartItemData?.priceFull;
  }

  double? getTotal(NewCartItems? cartItemData){
     if(cartItemData?.ItemType == "Half") {
       var price = cartItemData?.priceHalf??0.0;
       var qty = cartItemData?.quantity??1;
       return  price * qty ;
    } else{
       var price = cartItemData!.priceFull??0.0;
       var qty = cartItemData.quantity??1;
     return  price * qty ;
    }
  }
}
