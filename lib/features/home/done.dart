import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/home/home_screen.dart';

class DonePage extends StatelessWidget {
  final String text;
  const DonePage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Image.asset(MyAppImage.done),
      SizedBox(height: 20,),
      Text(text,style: MyTextStyle.meduimtitle(color: Get.theme.hintColor),),
         SizedBox(height: 20,),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Mybutton(text: "done".tr,onTap: () {
        Get.offAll(()=>HomeScreen());
        },),
      ),
    ],),),
    );
  }
}