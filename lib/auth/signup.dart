import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';

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

  void handleSignup() {
    if (formstate.currentState!.validate()) {
      // TODO: هنا تحط API signup أو حفظ بيانات
      // مثال: Navigator.pop(context); // يرجع لتسجيل الدخول
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم التحقق من البيانات ✅')),
      );
    }
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
                // keyboardType: TextInputType.phone, // إذا MyInputField يدعمها
              ),

              const SizedBox(height: 20),

              MySubtitleSgin(
                underlinetext: "تسجيل الدخول",
                text: "لديك حساب بالفعل؟",
                // لو الودجت عندك يدعم onTap ضيفه هنا:
                // onTap: () => Navigator.pop(context),
              ),

              const SizedBox(height: 28),

              Mybutton(
                text: "انشاء",
                onTap: () {
                  handleSignup();
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