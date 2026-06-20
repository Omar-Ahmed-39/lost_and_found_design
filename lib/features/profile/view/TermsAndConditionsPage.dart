import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: MyAppbarWithoutdetails("terms and conditions".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Directionality(
                  textDirection: TextDirection.rtl,

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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.policy_outlined,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                  ),
          
                  const SizedBox(height: 20),
          
                  Center(
                    child: Text(
                      "terms and conditions".tr,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          
                  const SizedBox(height: 8),
          
                  Center(
                    child: Text(
                      "terms_subtitle".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
          
                  const SizedBox(height: 30),
          
                  _SectionTitle(title: "terms_intro_title".tr),
                  _SectionText(text: "terms_intro_body".tr),
          
                  _SectionTitle(title: "terms_account_title".tr),
                  _SectionText(text: "terms_account_body".tr),
          
                  _SectionTitle(title: "terms_reports_title".tr),
                  _SectionText(text: "terms_reports_body".tr),
          
                  _SectionTitle(title: "terms_accuracy_title".tr),
                  _SectionText(text: "terms_accuracy_body".tr),
          
                  _SectionTitle(title: "terms_privacy_title".tr),
                  _SectionText(text: "terms_privacy_body".tr),
          
                  _SectionTitle(title: "terms_prohibited_title".tr),
                  _SectionText(text: "terms_prohibited_body".tr),
          
                  _SectionTitle(title: "terms_university_title".tr),
                  _SectionText(text: "terms_university_body".tr),
          
                  _SectionTitle(title: "terms_updates_title".tr),
                  _SectionText(text: "terms_updates_body".tr),
          
                  _SectionTitle(title: "terms_acceptance_title".tr),
                  _SectionText(text: "terms_acceptance_body".tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _SectionText extends StatelessWidget {
  final String text;

  const _SectionText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        height: 1.7,
        color: Colors.grey,
      ),
      textAlign: TextAlign.start,
    );
  }
}