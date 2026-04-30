import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/auth/controller/singin_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  SinginController controller = Get.put(SinginController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Form(
          key: controller.formstate,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            children: [
              const SizedBox(height: 40),

               Text(
                "signin".tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 40),

              MyInputField(
                controller: controller.emailController,
                hint:  "write email".tr,
                title: "email".tr,
                val: (val) => MyValidators.validateEmail(val),
              ),

              const SizedBox(height: 20),
 GetBuilder<SinginController>(
  builder: (controller) {
   return              MyInputField(
                hint:"write password".tr,
                title: "password".tr,
                controller: controller.passwordController,
                val: (val) => MyValidators.validatePassword(val),
                ispassword: true,
                obscure: controller.obscure,
                onTap: () {
                  controller.changeObscure();
                },
              );
 },),

              const SizedBox(height: 18),

              InkWell(
                onTap: () {
                  Get.toNamed("/SignupPage");
                },
                child: MySubtitleSgin(
                  underlinetext: "create new account".tr,
                  text: "do not you have account?".tr,
                ),
              ),

              const SizedBox(height: 28),
              GetBuilder<SinginController>(
                builder: (controller) {
                  if (controller.isloading == false) {
                    return Mybutton(
                      text: "signin".tr,
                      onTap: () {
                        controller.signDio();
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
