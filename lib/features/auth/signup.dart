import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/auth/controller/singup_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupController controller = Get.put(SignupController());

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

              const Text(
                "انشاء حساب",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              MyInputField(
                hint: "اكتب الاسم",
                title: "الاسم كامل",
                controller: controller.nameController,
                val: (val) => MyValidators.validateRequired(val),
              ),

              const SizedBox(height: 20),

              MyInputField(
                hint: "اكتب البريد",
                title: "البريد الالكتروني",
                controller: controller.emailController,
                val: (val) => MyValidators.validateEmail(val),
              ),

              const SizedBox(height: 20),

              GetBuilder<SignupController>(
                builder: (controller) {
                  return MyInputField(
                    hint: "اكتب كلمة المرور",
                    title: "كلمة المرور",
                    controller: controller.passwordController,
                    val: (val) => MyValidators.validatePassword(val),
                    ispassword: true,
                    obscure: controller.obscure,
                    onTap: () {
                      controller.changeObscure();
                    },
                  );
                },
              ),

              const SizedBox(height: 18),

              MyInputField(
                hint: "اكتب الرقم",
                title: "رقم الهاتف",
                controller: controller.phoneController,
                val: (val) => MyValidators.validatePhone(val),
              ),

              const SizedBox(height: 20),

              MySubtitleSgin(
                underlinetext: "تسجيل الدخول",
                text: "لديك حساب بالفعل؟",
              ),

              const SizedBox(height: 28),

              GetBuilder<SignupController>(
                builder: (controller) {
                  if (controller.isloading == false) {
                    return Mybutton(
                      text: "انشاء",
                      onTap: () {
                        controller.signupDio();
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}