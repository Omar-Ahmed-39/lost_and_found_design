import 'package:flutter/material.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/home/home.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

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
      Text("تم استلام البلاغ للمراجعة",style: MyTextStyle.meduimtitle(),),
         SizedBox(height: 20,),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Mybutton(text: "تم",onTap: () {
         Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) =>Homepage() ),(route) => false,); 
        },),
      ),
    ],),),
    );
  }
}