
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/features/home/controller/home_controller.dart';
import 'package:lostandfound/features/home/view/details.dart';
import 'package:lostandfound/features/home/view/widget/card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () => controller.getItems(),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 20,
                    ),
                    child: _buildBody(controller),
                  ),
                ),

                if (controller.isPaginating)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(HomeController controller) {
    switch (controller.state) {
      case HomeState.initial:
      case HomeState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case HomeState.empty:
        return _buildEmptyState();

      case HomeState.error:
        return _buildErrorState(controller);

      case HomeState.success:
        return Scrollbar(
          controller: controller.scrollController,
          interactive: true,
          thickness: 4,
          radius: const Radius.circular(10),
          child: GridView.builder(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.items.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.92,
            ),
            itemBuilder: (context, index) {
              final item = controller.items[index];

              return InkWell(
                onTap: () {
                  
                  Get.to(
                    () => DetailsPage(
                      title: item.itemName,
                      description: item.itemName,
                      reportId: item.id,
                      date: item.dateReported?.toString() ?? "",
                      status: item.reportType,
                      statusColor:
                          item.reportType.toLowerCase() == "lost"
                              ? Colors.redAccent
                              : Colors.greenAccent,
                      image:
                          "http://127.0.0.1:5000/${item.imagePath}",
                      location: item.locationName,
                      reporterName: item.reporterName,
                    ),
                  );
                },
                child: OfferCard(
                  title: item.itemName,
                  date: item.dateReported?.toString() ?? "",
                  status: item.reportType,
                  statusColor:
                      item.reportType.toLowerCase() == "lost"
                          ? Colors.redAccent
                          : Colors.greenAccent,
                  imageUrl:
                      "http://127.0.0.1:5000/${item.imagePath}",
                ),
              );
            },
          ),
        );
    }
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.inbox_outlined,
            size: 70,
            color: Colors.grey,
          ),
          const SizedBox(height: 12),
          Text(
            "there are not post at the moment".tr,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(HomeController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.restart_alt_outlined,
              size: 70,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              controller.getItems();
            },
          ),
          const SizedBox(height: 10),
          Text(
            "Click to retry".tr,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

