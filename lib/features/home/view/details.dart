import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/home/controller/details_controller.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final int reportId;

  final String date;
  final String status;
  final Color statusColor;
  final String image;

  final String location;
  final String reporterName;

  DetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.reportId,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.image,
    required this.location,
    required this.reporterName,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final DetailsController detailsController = Get.put(DetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailsController.getReportById(widget.reportId);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = screenHeight * (2 / 5);

    return Scaffold(
      backgroundColor: Get.theme.cardColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: appBarHeight,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: _buildCircleButton(
                context,
                Icons.arrow_back_ios_new,
                () => Get.back(),
              ),
              actions: [
                _buildCircleButton(context, Icons.share, () {}),
                const SizedBox(width: 16),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Get.theme.cardColor,
                      child: const Center(
                        child: Icon(Icons.image_outlined, size: 80),
                      ),
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// العنوان والحالة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: widget.statusColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.status.toLowerCase() == "lost"
                                ? "lost".tr
                                : "found".tr,
                            style: TextStyle(
                              color: widget.statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    _buildDetailItem(
                      Icons.info_outline,
                      "status".tr,
                      widget.status.toLowerCase() == "lost"
                          ? "lost".tr
                          : "found".tr,
                    ),

                    _buildDetailItem(
                      Icons.calendar_month_outlined,
                      "date".tr,
                      widget.date,
                    ),

                    _buildDetailItem(
                      Icons.location_on_outlined,
                      "location".tr,
                      widget.location,
                    ),

                    _buildDetailItem(
                      Icons.person_outline,
                      "المعلن",
                      widget.reporterName,
                    ),

                    const Divider(height: 40),

                    Text(
                      "item description".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    GetBuilder<DetailsController>(
                      builder: (controller) {
                        return Text(
                          controller.description,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 94, 92, 92),
                            height: 1.6,
                            fontSize: 16,
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: Mybutton(
                        text: "claim".tr,
                        onTap: () {
                          detailsController.claim(widget.reportId);
                        },
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blueAccent, size: 24),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: Colors.white),
        ),
      ),
    );
  }
}
