import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/auth/cubit/auth_cubit.dart';
import 'package:lostandfound/features/home/home_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late GlobalKey<FormState> formstate;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  bool obscure = true;

  @override
  void initState() {
    formstate = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formstate,
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
                controller: nameController,
                val: (val) => MyValidators.validateRequired(val),
              ),

              const SizedBox(height: 20),

              MyInputField(
                hint: "اكتب البريد",
                title: "البريد الالكتروني",
                controller: emailController,
                val: (val) => MyValidators.validateEmail(val),
              ),

              const SizedBox(height: 20),

              MyInputField(
                hint: "اكتب كلمة المرور",
                title: "كلمة المرور",
                controller: passwordController,
                val: (val) => MyValidators.validatePassword(val),
                ispassword: true,
                obscure: obscure,
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              ),

              const SizedBox(height: 18),

              MyInputField(
                hint: "اكتب الرقم",
                title: "رقم الهاتف",
                controller: phoneController,
                val: (val) => MyValidators.validatePhone(val),
              ),

              const SizedBox(height: 20),

              MySubtitleSgin(
                underlinetext: "تسجيل الدخول",
                text: "لديك حساب بالفعل؟",
              ),

              const SizedBox(height: 28),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is SingupErorr) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }

                  if (state is SingupSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthInitial) {
                    return Mybutton(
                      text: "انشاء",
                      onTap: () {
                        if (formstate.currentState!.validate()) {
                          context.read<AuthCubit>().signUpDio(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            phoneController.text,
                          );
                        }
                      },
                    );
                  } else if (state is SingupLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return const SizedBox();
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