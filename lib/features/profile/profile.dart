import 'package:flutter/material.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
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
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return 
    
       Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    image: AssetImage(MyAppImage.sanker), // غيّر المسار لصورتك
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
                      title: 'تعديل الملف الشخصي',
                      subtitle: 'تحديث الملف الشخصي',
                      iconBg: MyAppColor.lightBlue,
                      iconColor: MyAppColor.primaryBlue,
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ProfileOptionTile(
                      icon: Icons.lock_outline_rounded,
                      title: 'تغيير كلمة المرور',
                      subtitle: 'تحديث كلمة المرور لحسابك',
                      iconBg: MyAppColor.lightBlue,
                      iconColor: MyAppColor.primaryBlue,
                      onTap: () {},
                    ),

                    const Divider(height: 1),
                    ProfileOptionTile(
                      icon: Icons.description_outlined,
                      title: 'سياسة الاستخدام',
                      subtitle: 'الاطلاع على الشروط والأحكام',
                      iconBg: const Color(0xFFFFF5E8),
                      iconColor: MyAppColor.gold,
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ProfileOptionTile(
                      icon: Icons.help_outline_rounded,
                      title: 'المساعدة والدعم',
                      subtitle: 'التواصل مع فريق الدعم',
                      iconBg: const Color(0xFFFFF5E8),
                      iconColor: MyAppColor.gold,
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ProfileOptionTile(
                      icon: Icons.info_outline_rounded,
                      title: 'عن التطبيق',
                      subtitle: 'معلومات الإصدار والتطبيق',
                      iconBg: const Color(0xFFFFF5E8),
                      iconColor: MyAppColor.gold,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Logout Button
              SizedBox(
                width: double.infinity,

                child: Mybutton(text: "تسجيل الخروج", onTap: () {}),
              ),

              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Mybutton(
                  text: "حذف الحساب",
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


