import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';

class DashboardTabBar extends StatelessWidget {
  const DashboardTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.AppBackgroundColor,
      child: TabBar(
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black),
          tabs: [
            Tab(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Pending"),
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Prepairing"),
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Completed"),
                ),
              ),
            )
          ]
      ),
    );
  }
}
