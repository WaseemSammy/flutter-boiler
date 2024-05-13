import 'package:flutter/material.dart';
import 'package:my_flutter/models/dashboard_response.dart';

import '../../../../widgets/small_text.dart';

class DashboardFloorFilter extends StatefulWidget {
  final List<Areas>? areas;
  const DashboardFloorFilter(this.areas, {super.key});

  @override
  State<DashboardFloorFilter> createState() => _DashboardFloorFilterState();
}

class _DashboardFloorFilterState extends State<DashboardFloorFilter> {
  final double runSpacing = 3;
  final double spacing = 3;
  final int listSize = 4;
  final columns = 3;
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) / widget.areas!.length??1;
    return Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.center,
        children: List.generate(widget.areas?.length??0, (index) {
          return InkWell(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });

            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              width: w,
              decoration: BoxDecoration(
                  color: selectedIndex==index?Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black)),

              child: Align(
                alignment: Alignment.center,
                child: SmallText(text: " ${widget.areas?[index].areaName}",
                  color: selectedIndex==index?Colors.white : Colors.black,
                ),
              ),
            ),
          );
        })
    );
  }
}
