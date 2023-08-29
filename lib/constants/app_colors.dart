import 'dart:ui';

class AppColors {

  static const Darkgrey =  Color(0xffaaaaaa);
  static const PrimaryAssentColor =  Color(0xFF808080);
  static const PrimaryDarkColor =  Color(0xFF808080);
  static const ErroColor =  Color(0xFF808080);
  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
}