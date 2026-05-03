import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/local/local.dart';
import 'package:lostandfound/core/local/local_controller.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/core/theme/controller/theme_controller.dart';
import 'package:lostandfound/features/auth/signup.dart';
import 'package:lostandfound/features/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // تأكد من تهيئة الكاش قبل تشغيل التطبيق
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    ThemeController themeController=Get.put(ThemeController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.initialLang,
      translations: MyLocal(),  
      theme:AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.initialTheme ,
      builder: (context, child) {
        return Directionality(
          
          textDirection: TextDirection.ltr, 
          child: child!,
        );
      },

      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: "/HomeScreen",
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: "/SignupPage",
          page: () => const SignupPage(),
        ),
      ],
    );
  }
}
class AppTheme {
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