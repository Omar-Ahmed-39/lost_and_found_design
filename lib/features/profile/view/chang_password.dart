import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/profile/controller/chang_password_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  final ChangPasswordController controller = Get.put(ChangPasswordController());

  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor, // لضمان تناسق الخلفية
      appBar: MyAppbarWithoutdetails("change password".tr),
      body: Directionality(
                textDirection: TextDirection.rtl,

        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formKey, // ربط الفورم بالمفتاح الموجود في الكنترولر
              child: Container(
                // الكونتينر البديل للكرت بشكل عصري وأنيق
                decoration: BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius: BorderRadius.circular(24), // زوايا أكثر انحناءً ونعومة
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04), // ظل خفيف جداً واحترافي
                      blurRadius: 20,
                      offset: const Offset(0, 8), // دفع الظل للأسفل قليلاً ليعطي عمقاً
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // أيقونة دائرية ناعمة مع خلفية خفيفة
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.lock_outline,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
        
                      const SizedBox(height: 20),
        
                      Text(
                        "change password".tr,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
        
                      const SizedBox(height: 8),
        
                      Text(
                        "enter current and new password".tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
        
                      const SizedBox(height: 30),
        
                      // حقل كلمة المرور الحالية
                      TextFormField(
                        controller: controller.currentPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please_enter_current_password".tr; // أضف الترجمة لهذا الـ Key
                          }
                          if (value.length < 8) {
                            return "password_too_short".tr; // للتحقق من الطول
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "current Password".tr,
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: 16),
        
                      // حقل كلمة المرور الجديدة
                      TextFormField(
                        controller: controller.newPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please_enter_new_password".tr;
                          }
                          if (value.length < 8) {
                            return "password_too_short".tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "new password".tr,
                          prefixIcon: const Icon(Icons.lock_reset),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: 28),
        
                      SizedBox(
                        width: double.infinity,
                        child: Mybutton(
                          text: "change".tr,
                          onTap: () {
                            controller.changePassword();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}