import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/screens/newDesign/style.dart';
import 'package:my_flutter/utils/utils_helper.dart';

import '../../../constants/app_colors.dart';

class TableCard extends StatelessWidget {
  final String table;
  final String status;
  final VoidCallback onPressed;

  const TableCard({super.key, required this.table, required this.status,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("table click");
        onPressed();
        },
      child: Container(
        color: Utils.intence.getRandomColor(table),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PrimaryText(
                    text: table,
                    color: AppColors.white,
                    size: 16,
                    fontWeight: FontWeight.w700
                      
                ),
              ),
              const SizedBox(height: 10),
              const Expanded(
                child: PrimaryText(
                  text:  "Menu   →  5",
                  color: AppColors.secondary,
                  size: 16,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
