import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: MyAppbarWithoutdetails("about app".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
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
            child: Directionality(
                                  textDirection: TextDirection.rtl,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.info_outline,
                          size: 42,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 20),
              
                  Center(
                    child: Text(
                      "lost and found app".tr,
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
                      "hadhramout_university".tr,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              
                  const SizedBox(height: 30),
              
                  _InfoCard(
                    icon: Icons.apps,
                    title: "app_name".tr,
                    value: "lost and found app".tr,
                  ),
              
                  const SizedBox(height: 12),
              
                  _InfoCard(
                    icon: Icons.school_outlined,
                    title: "institution".tr,
                    value: "hadhramout_university".tr,
                  ),
              
                  const SizedBox(height: 12),
              
                  _InfoCard(
                    icon: Icons.system_update_alt,
                    title: "version".tr,
                    value: "1.0.0",
                  ),
              
                  const SizedBox(height: 12),
              
                  _InfoCard(
                    icon: Icons.category_outlined,
                    title: "app_type".tr,
                    value: "university_service_app".tr,
                  ),
              
                  const SizedBox(height: 28),
              
                  _SectionTitle(title: "about_app_title".tr),
                  _SectionText(text: "about_app_body".tr),
              
                  _SectionTitle(title: "app_goal_title".tr),
                  _SectionText(text: "app_goal_body".tr),
              
                  _SectionTitle(title: "main_features_title".tr),
                  _BulletText(text: "feature_report_lost".tr),
                  _BulletText(text: "feature_report_found".tr),
                  _BulletText(text: "feature_search_reports".tr),
                  _BulletText(text: "feature_categories".tr),
                  _BulletText(text: "feature_profile".tr),
                  _BulletText(text: "feature_support".tr),
              
                  _SectionTitle(title: "target_users_title".tr),
                  _SectionText(text: "target_users_body".tr),
              
                  _SectionTitle(title: "app_scope_title".tr),
                  _SectionText(text: "app_scope_body".tr),
              
                  _SectionTitle(title: "developer_note_title".tr),
                  _SectionText(text: "developer_note_body".tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
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

class _BulletText extends StatelessWidget {
  final String text;

  const _BulletText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}