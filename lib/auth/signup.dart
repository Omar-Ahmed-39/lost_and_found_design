import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
              "انشاء حساب",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 40),
           MyInputField(hint: "اكتب الاسم",title: "الاسم كامل",),

            const SizedBox(height: 20),

            MyInputField(hint: "اكتب البريد",title: "البريد الالكتروني",),

            const SizedBox(height: 20),

             MyInputField(hint: "اكتب كلمة المرور",title: "كلمة المرور",),

            const SizedBox(height: 18),
            MyInputField(hint: "اكتب الرقم",title: "رقم الهاتف",),

            const SizedBox(height: 20),

           MySubtitleSgin(underlinetext: "تسجيل الدخول", text: "لديك حساب بالفعل؟",),

            const SizedBox(height: 28),

           Mybutton(text: "انشاء",onTap: () {
             
           },),
                       const SizedBox(height: 28),

            
            
          ],
        ),
      ),
    );
  }
}

