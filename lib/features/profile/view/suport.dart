import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/profile/controller/suport_controller.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
      init: SupportController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          appBar: MyAppbarWithoutdetails("technical support".tr),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: Get.theme.cardColor,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.support_agent,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          "technical support".tr,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "send_your_problem_details".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 30),

                        TextFormField(
                          controller: controller.subjectController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "please_enter_subject".tr;
                            }

                            if (value.trim().length < 3) {
                              return "subject_too_short".tr;
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "problem title".tr,
                            prefixIcon: const Icon(Icons.title),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: controller.messageController,
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "please_enter_problem_description".tr;
                            }

                            if (value.trim().length < 10) {
                              return "description_too_short".tr;
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "problem description".tr,
                            alignLabelWithHint: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(bottom: 90),
                              child: Icon(Icons.description),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "rating".tr,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) {
                              final starValue = index + 1;

                              return IconButton(
                                onPressed: () {
                                  controller.changeRating(starValue);
                                },
                                icon: Icon(
                                  starValue <= controller.rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 34,
                                ),
                              );
                            },
                          ),
                        ),

                        Text(
                          controller.rating == 0
                              ? "please_select_rating".tr
                              : "${"your_rating".tr}: ${controller.rating}/5",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 28),

                        SizedBox(
                          width: double.infinity,
                          child: Mybutton(
                            text: controller.isLoading
                                ? "loading".tr
                                : "send".tr,
                            onTap: controller.isLoading
                                ? null
                                : () {
                                    controller.sendSupportRequest();
                                  },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}