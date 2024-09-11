import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
   BigText({super.key,
    this.color = const Color(0xFF077bd7),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 14
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return AutoSizeText(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
       fontSize: size,
        fontFamily: 'Raleway',


    )
    );
  }
}
