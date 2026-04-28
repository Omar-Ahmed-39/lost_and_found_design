import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/auth/cubit/auth_cubit.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/home/home_screen.dart';
import 'package:lostandfound/model/signin_model.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late GlobalKey<FormState> formstate;
  late TextEditingController emailController;
  late TextEditingController passwordController;
   bool obscure =true;

  @override
  void initState() {
    formstate = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

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
                'تسجيل الدخول',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 40),

              MyInputField(
                controller: emailController,
                hint: "اكتب البريد",
                title: "البريد الالكتروني",
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

              MySubtitleSgin(
                underlinetext: "انشاء حساب",
                text: "ليس لديك حساب؟",
              ),

              const SizedBox(height: 28),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is SinginErorr) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state is SinginSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthInitial) {
                    return Mybutton(
                      text: "تسجيل",
                      onTap: () {
                        if (formstate.currentState!.validate()) {
                          context.read<AuthCubit>().signDio(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                    );
                  } else if (state is SinginLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

