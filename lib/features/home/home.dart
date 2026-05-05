import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/features/home/controller/home_controller.dart';
import 'package:lostandfound/features/home/details.dart';
import 'package:lostandfound/features/home/widget/card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Column(
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
          ],
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
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
             
            ],
          ),
        );

      case HomeState.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
               icon: const Icon( Icons.restart_alt_outlined,
                size: 70,
                color: Colors.blueAccent,),
                onPressed: () {
                   controller.getItems();
                }
              ),
            
            ],
          ),
        );

      case HomeState.success:
        return GridView.builder(
          itemCount: controller.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.92,
          ),
          itemBuilder: (context, index) {
            final items = controller.items[index];

            return InkWell(
              onTap: () {
                Get.to(
                  () => DetailsPage(
                    title: items.itemName,
                    date: items.dateReported.toString(),
                    status: items.reportType,
                    statusColor: items.reportType==1?Colors.redAccent:Colors.greenAccent,
                    image: items.imagePath,
                  ),
                );
              },
              child: OfferCard(
           title: items.itemName,
                    date: items.dateReported.toString(),
                    status: items.reportType,
                    statusColor: items.reportType==1?Colors.redAccent:Colors.greenAccent,
                    imageUrl: items.imagePath, 
              ),
            );
          },
        );
    }
  }
}