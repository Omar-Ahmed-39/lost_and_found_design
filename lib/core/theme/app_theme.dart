import 'package:flutter/material.dart';


class MyTextStyle {
  static TextStyle title({Color? color}) {
    return TextStyle(
    
      fontWeight: FontWeight.w600,
      color: color??AppTheme.title,
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
class AppTheme {

 static Color bg_page=Color(0xffF6F6F6);
  static Color primarybutton=Color(0xff559DD7);
  static Color bg_lost=Color(0xCCFFE1E1);
  static Color bg_found=Color(0xCCDFF7E3);
  static Color card= Color(0xCCE7E7E7);
  static Color title= Color(0xCC000000);
  static Color primaryBlue = Color(0xFF5EA3DB);
    static Color softPink = Color(0xFFF9E7E7);
    static Color gold = Color(0xFFD8A84E);
    static Color bgColor = Color(0xFFF7F7F7);
    static Color cardColorr = Colors.white;
    static Color textDark = Color(0xFF222222);
    static Color textGrey = Color(0xFF777777);
    static Color danger = Color(0xFFE45C5C);








  // Light Theme Colors
  static const Color _lightBackground = Color(0xFFF7F5FA);
  static const Color _lightForeground = Color(0xFF1E1D23);
  static const Color _lightCard = Color(0xFFFCFCFC);
  static const Color _lightPrimary =  Color(0xFF5EA3DB);
  static const Color _lightPrimaryForeground = Color(0xFFFCFCFC);
  static const Color _lightSecondary = Color(0xFFF2F2E8);
  static const Color _lightAccent = Color(0xFFE08A4F);
  static const Color _lightDestructive =Color(0xFFE45C5C);
  static const Color _lightMuted = Color(0xFFEFEEEF);
  static const Color _lightMutedForeground = Color(0xFF918DA3);
  static const Color _lightBorder = Color(0xFFEBEAED);
  static const Color _lightInput = Color(0xFFF7F5F7);
  static const Color _lightRing = Color(0xFF5F4DCC);
  static const Color _lightBackgroundGold = Color(0xFFFFF5E8);


   

  // Dark Theme Colors
  static const Color _darkBackground = Color(0xFF16151A);
  static const Color _darkForeground = Color(0xFFF5F5EB);
  static const Color _darkCard = Color(0xFF28262E);
  static const Color _darkPrimary =Color(0x33256DFF);
  static const Color _darkPrimaryForeground = Color(0xFF16151A);
  static const Color _darkSecondary = Color(0xFF413F4A);
  static const Color _darkAccent = Color(0xFFFFAD66);
  static const Color _darkDestructive = Color(0x33FF3B30);
  static const Color _darkMuted = Color(0xFF474551);
  static const Color _darkMutedForeground = Color(0xFFB2AECD);
  static const Color _darkBorder = Color(0xFF413F4A);
  static const Color _darkInput = Color(0xFF32303B);
  static const Color _darkRing = Color(0xFF9C82FF);
  static const Color darkBackgroundGold = Color.fromARGB(255, 90, 73, 55);
      static Color lightBlue = Color(0xFFEAF4FE);


  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPrimary,
    scaffoldBackgroundColor: _lightBackground,
    cardColor: _lightCard,
    dividerColor: _lightBorder,
    hintColor: _lightMutedForeground,

  
    colorScheme: ColorScheme.light(
      //backgrond container profile
      onPrimaryContainer: _lightBackgroundGold,
      primary: lightBlue,
      onPrimary: _lightPrimaryForeground,
      secondary: _lightSecondary,
      onSecondary: _lightForeground,
      surface: _lightCard,
      onSurface: _lightForeground,
      background: _lightBackground,
      onBackground: _lightForeground,
      error: _lightDestructive,
      onError: _lightPrimaryForeground,
      brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightInput,
      hintStyle: const TextStyle(color: _lightMutedForeground),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _lightInput),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _lightRing, width: 2),
      ),
    ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightPrimary,
        foregroundColor: _lightPrimaryForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _lightForeground,
        side: const BorderSide(color: _lightBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _lightPrimary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: _lightForeground),
    ),
    
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPrimary,
    scaffoldBackgroundColor: _darkBackground,
    cardColor: _darkCard,
    dividerColor: _darkBorder,
    hintColor: _darkMutedForeground,
   
    colorScheme: const ColorScheme.dark(
            onPrimaryContainer: darkBackgroundGold,

      primary: _darkPrimary,
      onPrimary: _darkPrimaryForeground,
      secondary: _darkSecondary,
      onSecondary: _darkForeground,
      surface: _darkCard,
      onSurface: _darkForeground,
      background: _darkBackground,
      onBackground: _darkForeground,
      error: _darkDestructive,
      onError: _darkPrimaryForeground,
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkInput,
        errorStyle: const TextStyle(
    color: Color.fromARGB(255, 180, 65, 36), // لون رسالة الخطأ تحت الحقل
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
      hintStyle: const TextStyle(color: _darkMutedForeground),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _darkInput),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _darkRing, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkPrimary,
        foregroundColor: _darkPrimaryForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _darkForeground,
        side: const BorderSide(color: _darkBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _darkPrimary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: _darkForeground),
    ),
  
  );
}
