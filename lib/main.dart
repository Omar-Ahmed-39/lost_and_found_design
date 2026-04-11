import 'package:flutter/material.dart';
import 'package:lostandfound/features/auth/sign.dart';
import 'package:lostandfound/features/auth/signin.dart';
import 'package:lostandfound/features/auth/signup.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/home/home_screen.dart';
import 'package:lostandfound/features/home/splash_screen.dart';
import 'package:lostandfound/features/search/search.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        scaffoldBackgroundColor:MyAppColor.bg_page, 
      ),
      home: SplashScreen(),
      routes:  {
        "SigninPage":(context)=>SigninPage(),
        "SignupPage":(context)=>SignupPage(),
        "HomePage":(context)=>Homepage(),



        
       },
    );
  }
}
