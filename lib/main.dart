import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/Middleware/middlewares.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/binding/binding.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/local/local.dart';
import 'package:lostandfound/core/local/local_controller.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/core/theme/controller/theme_controller.dart';
import 'package:lostandfound/features/auth/view/sign.dart';
import 'package:lostandfound/features/auth/view/signin.dart';
import 'package:lostandfound/features/auth/view/signup.dart';
import 'package:lostandfound/features/home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

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
      initialBinding: Mybinding(),
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
          page: () => const Sign(),
           middlewares: [AuthMiddlewares()]
        ),
        GetPage(
          name: "/HomeScreen",
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: "/SignupPage",
          page: () => const SignupPage(),
        ),
         GetPage(
          name: "/SigninPage",
          page: () => const SigninPage(),
        ),
      ],
    );
  }
}
