
import 'package:flutter/material.dart';

class AppColors {

  static const Darkgrey =  Color(0xffaaaaaa);
  static const PrimaryAssentColor =  Color(0xFF808080);
  static const PrimaryDarkColor =  Color(0xFF808080);
  static const ErroColor =  Color(0xFF808080);
  static const white = Colors.white;
  static const secondary = Color(0xffa6a6a6);
  static const iconGray = Color(0xff767676);
  static const black = Colors.black;
  static const primary = Color(0xff262626);
  static const primaryBg = Color(0xfff5f5fd);
  static const secondaryBg = Color(0xffececf6);
  static const barBg = Color(0xffe3e3ee);
  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
}