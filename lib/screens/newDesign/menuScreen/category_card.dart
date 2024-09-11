import 'package:flutter/material.dart';
import 'package:my_flutter/models/food_category_response.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/utils_helper.dart';
import '../style.dart';

class CategoryCard extends StatefulWidget {
  final Function(int? val,int? index) onPressed;
  final CategoryData? data;
  final int? selectedCategory;
  final int? index;
  const CategoryCard(this.index, {super.key,required this.onPressed,this.data,required this.selectedCategory});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ widget.onPressed(widget.data?.categoryId,widget.index);},
      child: Container(
        color: Utils.intence.getRandomColor(widget.data!.categoryName),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryText(
                        text: "${widget.data!.categoryName}",
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
              if(widget.selectedCategory!=null && widget.data?.categoryId==widget.selectedCategory)Container(
                height: double.infinity,
                color: Colors.transparent.withOpacity(0.2),child: const Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.white,),)
            ],
          ),
        ),
      ),
    );
  }
}
