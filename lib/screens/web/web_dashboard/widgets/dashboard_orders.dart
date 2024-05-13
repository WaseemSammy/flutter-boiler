import 'package:flutter/material.dart';

import '../../../../widgets/big_text.dart';

class DashboardOrders extends StatefulWidget {
  const DashboardOrders( {super.key});

  @override
  State<DashboardOrders> createState() => _DashboardOrdersState();
}

class _DashboardOrdersState extends State<DashboardOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BigText(text: "Type"),
          BigText(text: "Order Number"),
          BigText(text: "Amount"),
          BigText(text: "Status"),
          BigText(text: "Time"),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                color: const Color(0xFF077bd7),
                borderRadius: BorderRadius.circular(5)
            ),
              child: BigText(text: "Print",color: Colors.white,)),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
            size: 30,
          ),

        ],
      ),
    );
  }
}
