import 'package:flutter/material.dart';
import 'package:lostandfound/auth/sign.dart';
import 'package:lostandfound/auth/signin.dart';
import 'package:lostandfound/auth/signup.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/home/home.dart';

void main() {
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
      home: Sign(),
      routes:  {
        "SigninPage":(context)=>SigninPage(),
        "SignupPage":(context)=>SignupPage(),
        "HomePage":(context)=>Homepage(),


        
       },
    );
  }
}
