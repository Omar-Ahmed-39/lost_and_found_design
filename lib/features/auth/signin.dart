import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/home/home_screen.dart';
import 'package:lostandfound/model/signin_model.dart';

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
   bool isloading=false;

   late ApiConsumer api;

SignInModel? user;

  
 Future signDio()async{
  
 try {
  isloading=true;
  setState(() {
  });
 var responce=await api.post(EndPoint.signIn,
  data: {
       ApiKey.email: emailController.text.trim(),
         ApiKey.password: passwordController.text.trim(),
  
  });
  user=SignInModel.fromJson(responce);
  CacheHelper().saveData(key: "token", value: user!.dataSignin.token);
   
  return true;

} on ServerException catch (e) {
  isloading=false;
  setState(() {
  });
  print(e.erorrModel.erorrmessage);
  
   ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("فشل تسجيل الدخول، تأكد من البيانات")));
        return false;
}
 }

@override
  void initState() {
     formstate=GlobalKey();
     emailController=TextEditingController();
     passwordController=TextEditingController();
         api = DioConsumer(dio: Dio());


    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    

    super.dispose();
  }

  void handlesignin()async{
     if(formstate.currentState!.validate()){
     // bool  sign= await signDio();
      bool  sign= true;

      if(sign==true){
                Navigator.pushAndRemoveUntil(context, 
               MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false,);
               }
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
                controller: emailController,
                hint: "اكتب البريد",
                title: "البريد الالكتروني",
               val:(val) =>  MyValidators.validateEmail(val),),
          
              const SizedBox(height: 20),
          
               MyInputField(hint: "اكتب كلمة المرور",title: "كلمة المرور",
               controller: passwordController,
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
          
            isloading?Center(child: CircularProgressIndicator()): Mybutton(text: "تسجيل",onTap: () {
              handlesignin();
              
             },)
              
              
            ],
          ),
        ),
      ),
    );
  }
}