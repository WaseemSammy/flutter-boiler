import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../sizeConfig.dart';
import '../style.dart';

class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),

      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
              text: 'Recent Activities', size: 18, fontWeight: FontWeight.w800),
          PrimaryText(
            text: '02 Mar 2021',
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      const Column(
        children: []/*List.generate(
          recentActivities.length,
              (index) => PaymentListTile(
              icon: recentActivities[index]["icon"],
              label: recentActivities[index]["label"],
              amount: recentActivities[index]["amount"]),
        ),*/
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),

      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      )
    ]);
  }
}