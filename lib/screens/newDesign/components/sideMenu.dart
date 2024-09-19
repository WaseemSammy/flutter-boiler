import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../sizeConfig.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: AppColors.iconGray,
                    width: 25, // Set the width of the SVG
                    height: 25, // Set the height of the SVG

                  ),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: Image.asset(
                    'assets/icons/order_menu.png',
                    color: AppColors.iconGray,
                    width: 25, // Set the width of the SVG
                    height: 25,
                  ),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/icons/clipboard.svg',
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/icons/clipboard.svg',
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/icons/clipboard.svg',
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  icon: SvgPicture.asset(
                    'assets/icons/clipboard.svg',
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}