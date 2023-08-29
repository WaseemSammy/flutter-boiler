import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/font_family_constants.dart';



class SmallTextWithUnderLine extends StatelessWidget {
  double height;
  Color? color;
  final String text;
  double size;

  SmallTextWithUnderLine({Key? key,
    this.color = Colors.black,
    required this.text,
    this.height = 1.2,
    this.size = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamilyConstants.INTER_LIGHT,
          fontSize: size,
          decoration: TextDecoration.underline,
          height: height
      ),
    );
  }
}