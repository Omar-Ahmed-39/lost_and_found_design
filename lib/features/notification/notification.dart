import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/features/notification/controller/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        if (controller.notifications.isEmpty) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      size: 60,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "no notifications currently".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.hintColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.only(top: 170),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.notifications.length,
              itemBuilder: (context, index) {
                final notification = controller.notifications[index];
            
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.blueAccent.withOpacity(0.1),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.blueAccent,
                      ),
                    ),
                    title: Text(
                      notification["title"] ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        notification["body"] ?? "",
                        style: TextStyle(
                          color: Get.theme.hintColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}