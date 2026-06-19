import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/features/home/controller/home_screen_controller.dart';
import 'package:lostandfound/features/notification/controller/notification_controller.dart';
import 'package:lostandfound/features/report/view/report.dart';

class MyNavigationBottomBar extends StatelessWidget {
  const MyNavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

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
                color: Theme.of(context).cardColor,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavItem(
                  itemIndex: 3,
                  icon: Icons.person_outline,
                  label: "profile".tr,
                  onTap: () => controller.changeIndex(3),
                ),

                BottomNavItem(
                  itemIndex: 2,
                  icon: Icons.notifications_none,
                  label: "notifications".tr,
                  onTap: () {
                    controller.changeIndex(2);

                    Get.find<NotificationController>()
                        .markNotificationsAsRead();
                  },
                ),

                const SizedBox(width: 60),

                BottomNavItem(
                  itemIndex: 1,
                  icon: Icons.search,
                  label: "search".tr,
                  onTap: () => controller.changeIndex(1),
                ),

                BottomNavItem(
                  itemIndex: 0,
                  icon: Icons.home_outlined,
                  label: "home".tr,
                  onTap: () => controller.changeIndex(0),
                ),
              ],
            ),

            Positioned(
              bottom: 80 - 28,
              child: InkWell(
                onTap: () => Get.to(() => const ReportPage()),
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
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
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
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color activeColor;

  const BottomNavItem({
    super.key,
    required this.itemIndex,
    required this.icon,
    required this.label,
    required this.onTap,
    this.activeColor = const Color(0xFF8DBBE6),
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationController) {
        return GetBuilder<NavigationController>(
          builder: (controller) {
            final bool isActive =
                controller.currentIndex == itemIndex;

            return InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 160),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isActive
                            ? activeColor.withOpacity(0.25)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(
                            icon,
                            size: 28,
                            color: isActive
                                ? activeColor
                                : Theme.of(context).hintColor,
                          ),

                          if (itemIndex == 2 &&
                              notificationController
                                  .hasUnreadNotifications)
                            Positioned(
                              right: -2,
                              top: -2,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isActive
                            ? activeColor
                            : Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}