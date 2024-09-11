import 'package:flutter/material.dart';
import 'package:my_flutter/models/cartItems.dart';
import 'package:my_flutter/screens/newDesign/sizeConfig.dart';
import 'package:my_flutter/screens/newDesign/style.dart';

import '../../../constants/app_colors.dart';

class CategoryMenuItem extends StatefulWidget {
  final Orders? data;
  final Function(Orders? data) onPressed;
  const CategoryMenuItem({super.key, this.data, required this.onPressed});

  @override
  State<CategoryMenuItem> createState() => _CategoryMenuItemState();
}

class _CategoryMenuItemState extends State<CategoryMenuItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        widget.onPressed(widget.data);
      },
      child: Container(
        color: Colors.deepPurple[900],  // Removed fixed height
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                    text: widget.data?.itemName ?? "",
                    color: AppColors.white,
                    size: 14,
                    fontWeight: FontWeight.w700),
                PrimaryText(
                    text: "Rs ${widget.data?.itemPrice}",
                    color: AppColors.white,
                    size: 10,
                    fontWeight: FontWeight.w300),
              ],
            ),
          ),
        ),
      )


    );
  }
}
