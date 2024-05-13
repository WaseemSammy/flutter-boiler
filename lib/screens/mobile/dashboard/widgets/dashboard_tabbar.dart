import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/models/dashboard_response.dart';
import 'package:my_flutter/widgets/big_text.dart';

import '../../../../constants/color_constants.dart';

class DashboardTabBar extends StatelessWidget {
  final List<OrderStatus>? orderStatus;
  const DashboardTabBar(this.orderStatus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      color: ColorConstants.AppBackgroundColor,
      child: TabBar(

          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 2),
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black),
          tabs: orderStatus!.map((e) => Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black)),
              child: Align(
                alignment: Alignment.center,
                child: Text("${e.name}"),
              ),
            ),
          )).toList()


      ),
    );
  }
}
