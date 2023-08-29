import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/font_family_constants.dart';


class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
   BigText({Key? key,
    this.color = Colors.black,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 14
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: overflow,
      style: TextStyle(
        color: color,
          fontWeight: FontWeight.w500,
          fontSize: size,
          fontFamily: FontFamilyConstants.Inter_ExtraBold
      ),
    );
  }
}
