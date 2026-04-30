import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/local/local_controller.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/profile/widget/section_card.dart';
import 'package:lostandfound/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  MyLocalController controller = Get.put(MyLocalController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 170),

            // Profile image
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(MyAppImage.sanker),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 14),

            Text(
              'علي بن سميدع',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: MyAppColor.textDark,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'alibnsomida826@gmail.com',
              style: TextStyle(fontSize: 14, color: MyAppColor.textGrey),
            ),
            const SizedBox(height: 15),

            SectionCard(
              child: Column(
                children: [
                  ProfileOptionTile(
                    icon: Icons.person_outline_rounded,
                    title: "edit profile".tr,
                    subtitle: "update profile".tr,
                    iconBg: MyAppColor.lightBlue,
                    iconColor: MyAppColor.primaryBlue,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ProfileOptionTile(
                    icon: Icons.lock_outline_rounded,
                    title: "change password".tr,
                    subtitle: "update your account password".tr,
                    iconBg: MyAppColor.lightBlue,
                    iconColor: MyAppColor.primaryBlue,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ProfileOptionTile(
                    icon: Icons.description_outlined,
                    title: "usage policy".tr,
                    subtitle: "view terms and conditions".tr,
                    iconBg: const Color(0xFFFFF5E8),
                    iconColor: MyAppColor.gold,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ProfileOptionTile(
                    icon: Icons.help_outline_rounded,
                    title: "help and support".tr,
                    subtitle: "contact support team".tr,
                    iconBg: const Color(0xFFFFF5E8),
                    iconColor: MyAppColor.gold,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ProfileOptionTile(
                    icon: Icons.info_outline_rounded,
                    title: "about app".tr,
                    subtitle: "version and app information".tr,
                    iconBg: const Color(0xFFFFF5E8),
                    iconColor: MyAppColor.gold,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),
            SectionCard(
              child: Column(
                children: [
                  ProfileOptionTile(
                    icon: Icons.language_rounded,
                    title: "language".tr,
                    subtitle: "change language".tr,
                    iconBg: MyAppColor.lightBlue,
                    iconColor: MyAppColor.primaryBlue,
                    onTap: () {
                      controller.changeLang();
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 19),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: Mybutton(
                text: "logout".tr,
                onTap: () {},
              ),
            ),

            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Mybutton(
                text: "delete account".tr,
                color: MyAppColor.danger,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 125),
          ],
        ),
      ),
    );
  }
}