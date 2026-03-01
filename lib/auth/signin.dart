import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/home/home.dart';

class SigninPage extends StatefulWidget {
   const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late GlobalKey<FormState> formstate;
  late TextEditingController emailController;
  late TextEditingController passwordController;
   bool obscure=true;


@override
  void initState() {
     formstate=GlobalKey();
     emailController=TextEditingController();
     passwordController=TextEditingController();

    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void handlesignin(){
     if(formstate.currentState!.validate()){
                Navigator.pushAndRemoveUntil(context, 
               MaterialPageRoute(builder: (context) => Homepage(),), (route) => false,);
               }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Form(
          key:formstate ,
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
          
              MyInputField(
                hint: "اكتب البريد",
                title: "البريد الالكتروني",
               val:(val) =>  MyValidators.validateEmail(val),),
          
              const SizedBox(height: 20),
          
               MyInputField(hint: "اكتب كلمة المرور",title: "كلمة المرور",
               val: (val) =>  MyValidators.validatePassword(val),
               ispassword: true,
               obscure:obscure ,
               onTap: () {
                 obscure=!obscure;
                 setState(() {
                   
                 });
               },),
          
              const SizedBox(height: 18),
          
             MySubtitleSgin(underlinetext: "انشاء حساب", text: "ليس لديك حساب؟"),
          
              const SizedBox(height: 28),
          
             Mybutton(text: "تسجيل",onTap: () {
              handlesignin();
              
             },)
              
              
            ],
          ),
        ),
      ),
    );
  }
}