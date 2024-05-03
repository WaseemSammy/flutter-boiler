import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/small_text.dart';

class DashboardFloorFilter extends StatelessWidget {
  const DashboardFloorFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:  Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black
          ),
          child: SmallText(text: 'Ground',color: Colors.white,size: 10,),
        ),
        SizedBox(width: 20,),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:  Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white
          ),
          child: SmallText(text: 'First',color: Colors.black,size: 10,),
        ),
        SizedBox(width: 20,),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black
          ),
          child: SmallText(text: 'Second',color: Colors.white,size: 10,),
        ),
        SizedBox(width: 20,),
      ],
    );
  }
}
