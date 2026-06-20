import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/features/home/model/details_model.dart';
import 'package:lostandfound/features/home/view/details.dart';
import 'package:lostandfound/features/home/view/widget/card.dart';
import 'package:lostandfound/features/notification/controller/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Stack(
          children: [
            controller.notifications.isEmpty
                ? Center(
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
                  )
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: const EdgeInsets.only(top: 150),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: controller.notifications.length,
                        itemBuilder: (context, index) {
                          final notification = controller.notifications[index];
                          final matchId = notification["matchId"];
                          print(notification);

                          if (matchId == null) {
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                title: Text(notification["title"] ?? ""),
                                subtitle: Text(notification["body"] ?? ""),
                              ),
                            );
                          }

                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "توجد عملية تطابق محتملة",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text("تم العثور على عنصر موجود مطابق لعنصؤك المفقود"),

                                  FutureBuilder(
                                    future: controller.getMatchReports(
                                      int.parse(matchId.toString()),
                                    ),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }

                                      final reports = snapshot.data!;

                                      final lostReport =
                                          reports["lost"] as ReportDetailsData?;

                                      final foundReport =
                                          reports["found"]
                                              as ReportDetailsData?;

                                      return GridView.count(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 0.7,
                                        children: [
                                          if (lostReport != null)
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                  () => DetailsPage(
                                                    reportId: lostReport.id,
                                                    title: lostReport.itemName,
                                                    description:
                                                        lostReport.description,
                                                    date:
                                                        lostReport.dateReported
                                                            ?.toString() ??
                                                        "",
                                                    status:
                                                        lostReport.reportType,
                                                    statusColor:
                                                        Colors.redAccent,
                                                    image:
                                                        lostReport
                                                            .images
                                                            .isNotEmpty
                                                        ? "http://127.0.0.1:5000/${lostReport.images.first.path}"
                                                        : "",
                                                    location:
                                                        lostReport.locationName,
                                                    reporterName: "",
                                                  ),
                                                );
                                              },
                                              child: OfferCard(
                                                title: lostReport.itemName,
                                                date:
                                                    lostReport.dateReported
                                                        ?.toString() ??
                                                    "",
                                                status: lostReport.reportType,
                                                statusColor: Colors.redAccent,
                                                imageUrl:
                                                    lostReport.images.isNotEmpty
                                                    ? "http://127.0.0.1:5000/${lostReport.images.first.path}"
                                                    : "",
                                              ),
                                            ),

                                          if (foundReport != null)
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                  () => DetailsPage(
                                                    reportId: foundReport.id,
                                                    title: foundReport.itemName,
                                                    description:
                                                        foundReport.description,
                                                    date:
                                                        foundReport.dateReported
                                                            ?.toString() ??
                                                        "",
                                                    status:
                                                        foundReport.reportType,
                                                    statusColor:
                                                        Colors.greenAccent,
                                                    image:
                                                        foundReport
                                                            .images
                                                            .isNotEmpty
                                                        ? "http://127.0.0.1:5000/${foundReport.images.first.path}"
                                                        : "",
                                                    location: foundReport
                                                        .locationName,
                                                    reporterName: "",
                                                  ),
                                                );
                                              },
                                              child: OfferCard(
                                                title: foundReport.itemName,
                                                date:
                                                    foundReport.dateReported
                                                        ?.toString() ??
                                                    "",
                                                status: foundReport.reportType,
                                                statusColor: Colors.greenAccent,
                                                imageUrl:
                                                    foundReport
                                                        .images
                                                        .isNotEmpty
                                                    ? "http://127.0.0.1:5000/${foundReport.images.first.path}"
                                                    : "",
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

            if (controller.notifications.isNotEmpty)
              Positioned(
                left: 20,
                bottom: 100,
                child: FloatingActionButton(
                  heroTag: "delete_notifications",
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.delete),
                  onPressed: () {
                    Get.dialog(
                      Dialog(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Get.theme.cardColor,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Delete Notifications",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "All notifications will be permanently deleted.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Get.theme.hintColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        controller.clearNotifications();
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
