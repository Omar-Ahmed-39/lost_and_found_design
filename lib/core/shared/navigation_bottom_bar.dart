import 'package:flutter/material.dart';
import 'package:lostandfound/home/home.dart';
import 'package:lostandfound/notification/notification.dart';
import 'package:lostandfound/profile/profile.dart';
import 'package:lostandfound/search/search.dart';
class MyNavigationBottomBar extends StatelessWidget {
  final int currentIndex;
  final VoidCallback? onFabTap;

  const MyNavigationBottomBar({
    super.key,
    required this.currentIndex,
    this.onFabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 14,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
            ),

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
              child: Container(
                height: 80,
                color: const Color(0xFFF6F6F6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem(
                      itemIndex: 0,
                      currentIndex: currentIndex,
                      icon: Icons.person_outline,
                      label: "ملفي",
                      onTap: () => Navigator.pushAndRemoveUntil(context, 
                      MaterialPageRoute(builder: (context) => ProfilePage(),), (route) => false,),
                    ),
                    BottomNavItem(
                      itemIndex: 1,
                      currentIndex: currentIndex,
                      icon: Icons.notifications_none,
                      label: "الإشعارات",
                      onTap: () => Navigator.pushAndRemoveUntil(context, 
                      MaterialPageRoute(builder: (context) => NotificationPage(),), (route) => false,),
                    ),
                    const SizedBox(width: 60),
                    BottomNavItem(
                      itemIndex: 2,
                      currentIndex: currentIndex,
                      icon: Icons.search,
                      label: "البحث",
                      onTap: () => Navigator.pushAndRemoveUntil(context, 
                      MaterialPageRoute(builder: (context) => SearchPage(),), (route) => false,),
                    ),
                    BottomNavItem(
                      itemIndex: 3,
                      currentIndex: currentIndex,
                      icon: Icons.home_outlined,
                      label: "الرئيسية",
                      onTap: () => Navigator.pushAndRemoveUntil(context, 
                      MaterialPageRoute(builder: (context) => Homepage(),), (route) => false,),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 80 - 20,
              child: GestureDetector(
                onTap: onFabTap,
                child: Transform.rotate(
                  angle: 0.785398,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC89A41),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Transform.rotate(
                      angle: -0.785398,
                      child: const Icon(Icons.add, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







class BottomNavItem extends StatelessWidget {
  final int itemIndex;
  final int currentIndex;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color activeColor;

  const BottomNavItem({
    super.key,
    required this.itemIndex,
    required this.currentIndex,
    required this.icon,
    required this.label,
    required this.onTap,
    this.activeColor = const Color(0xFF8DBBE6),
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentIndex == itemIndex;

    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          // بدل HitTestBehavior.opaque
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isActive ? activeColor.withOpacity(0.25) : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: isActive ? activeColor : Colors.black54,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? activeColor.withOpacity(0.25) : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? activeColor : Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
