import 'package:flutter/material.dart';

import '../constants/font_family_constants.dart';

class BigTextCenter extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigTextCenter({Key? key,
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
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: size,
          fontFamily: FontFamilyConstants.Inter_ExtraBold,

      ),
    );
  }
}
