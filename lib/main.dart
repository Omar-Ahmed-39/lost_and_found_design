import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/features/auth/signin.dart';
import 'package:lostandfound/features/auth/signup.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/home/home_screen.dart';
import 'package:lostandfound/features/splash/splash_screen.dart';
import 'package:lostandfound/test1.dart';

import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: MyAppColor.bg_page,
        ),
        getPages: [
      
      GetPage(name: "/", page:()=> HomeScreen(), ),
      GetPage(name: "/HomeScreen", page:()=> HomeScreen(),),
       GetPage(name: "/SignupPage", page:()=> SignupPage(),),
     

     ],
      );
    
  }
}