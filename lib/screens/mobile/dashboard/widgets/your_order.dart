import 'package:flutter/material.dart';
import 'package:my_flutter/widgets/big_text.dart';



class YourOrder extends StatefulWidget {
  const YourOrder({super.key});

  @override
  State<YourOrder> createState() => _YourOrderState();
}

class _YourOrderState extends State<YourOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BigText(text: "Table No"),
          BigText(text: "Starting Time"),
          BigText(text: "Total"),
          BigText(text: ""),

        ],
      ),
    );
  }
}
