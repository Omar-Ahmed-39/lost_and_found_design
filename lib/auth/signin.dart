import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/home/home.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          children: [
            const SizedBox(height: 40),

            const Text(
              'تسجيل الدخول',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 40),

            MyInputField(hint: "اكتب البريد",title: "البريد الالكتروني",),

            const SizedBox(height: 20),

             MyInputField(hint: "اكتب كلمة المرور",title: "كلمة المرور",),

            const SizedBox(height: 18),

           MySubtitleSgin(underlinetext: "انشاء حساب", text: "ليس لديك حساب؟"),

            const SizedBox(height: 28),

           Mybutton(text: "تسجيل",onTap: () {
             Navigator.pushAndRemoveUntil(context, 
             MaterialPageRoute(builder: (context) => Homepage(),), (route) => false,);
           },)
            
            
          ],
        ),
      ),
    );
  }
}