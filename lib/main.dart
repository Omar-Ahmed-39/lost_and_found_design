import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/local/local.dart';
import 'package:lostandfound/core/local/local_controller.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
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

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.initialLang,
      translations: MyLocal(),
      theme: ThemeData(
        scaffoldBackgroundColor: MyAppColor.bg_page,
      ),

      // --- الحل الجذري لتثبيت الاتجاه ---
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