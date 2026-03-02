import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/home/done.dart';

class ClaimPage extends StatelessWidget {
  const ClaimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails("اثبات ملكية"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          
          children: [
          MyInputFieldwithdetails(hint: "ارفع الاثبات", title:"رفع اثبات" , details: "(بطاقة شخصية-جواز سفر)"),
          SizedBox(height: 15,),
          MyInputField(hint: "اكتب وصفك", title: "وصف علامة مميزة"),
          SizedBox(height: 35,),
          Mybutton(text: "رفع",onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                           MaterialPageRoute(
                             builder: (context) =>DonePage(text: "تم استلام المطالبة للمراجعة",) ),(route) => false,);
            
          },)
        ],),
      ),
    );
  }
}