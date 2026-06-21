import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/Middleware/middlewares.dart';
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
import 'package:lostandfound/features/notification/controller/notification_controller.dart';
import 'package:lostandfound/features/profile/view/chang_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lostandfound/features/splash/splash_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
    await Firebase.initializeApp();


  List<Map<String, dynamic>> notifications =
      CacheHelper.getListMap(
    key: "notifications",
  );

  notifications.insert(0, {
    "title":
        message.notification?.title ?? "",
    "body":
        message.notification?.body ?? "",
    "matchId":
        message.data["matchId"],
  });

  await CacheHelper.saveListMap(
    key: "notifications",
    value: notifications,
  );

  print("background notification saved");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await CacheHelper().init();
      setupLocator();

     await Firebase.initializeApp();
       FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


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
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: "/Sign",
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
         GetPage(
          name: "/ChangePasswordPage",
          page: () =>  ChangePasswordPage(),
        ),
      ],
    );
  }
}
