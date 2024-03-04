import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/big_text.dart';

class YourOrder extends StatefulWidget {
  const YourOrder({Key? key}) : super(key: key);

  @override
  State<YourOrder> createState() => _YourOrderState();
}

class _YourOrderState extends State<YourOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BigText(text: "Table No"),
          BigText(text: "Starting Time"),
          BigText(text: "Total"),
          BigText(text: ""),

        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
    );
  }
}
