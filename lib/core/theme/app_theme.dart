import 'package:flutter/material.dart';

class MyAppColor{
  static Color bg_page=Color(0xffF6F6F6);
  static Color primarybutton=Color(0xff559DD7);
  static Color bg_lost=Color(0xCCFFE1E1);
  static Color bg_found=Color(0xCCDFF7E3);
  static Color card= Color(0xCCE7E7E7);
  static Color title= Color(0xCC000000);
  static Color primaryBlue = Color(0xFF5EA3DB);
    static Color lightBlue = Color(0xFFEAF4FE);
    static Color softPink = Color(0xFFF9E7E7);
    static Color gold = Color(0xFFD8A84E);
    static Color bgColor = Color(0xFFF7F7F7);
    static Color cardColorr = Colors.white;
    static Color textDark = Color(0xFF222222);
    static Color textGrey = Color(0xFF777777);
    static Color danger = Color(0xFFE45C5C);

}
class MyTextStyle {
  static TextStyle title({Color? color}) {
    return TextStyle(
    
      fontWeight: FontWeight.w600,
      color: color??MyAppColor.title,
      fontSize: 24,
      height: 20 / 24, // line-height
      letterSpacing: 0.24, // 1%
    );
  }
    static TextStyle meduimtitle({Color? color}) {
  return TextStyle(
    fontSize: 17,
     fontWeight: FontWeight.w200,
     color:color?? Colors.black,
  );
}
  
  static TextStyle subtitel({Color? color}) {
  return TextStyle(
    fontSize: 13,
     fontWeight: FontWeight.w200,
     color:color?? Colors.black,
  );
}

}
