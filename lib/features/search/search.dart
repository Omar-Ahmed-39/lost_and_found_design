import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/home/details.dart';
import 'package:lostandfound/features/home/widget/card.dart';
import 'package:lostandfound/features/search/controller/search_controller.dart';
import 'package:lostandfound/features/search/widget/active_filter.dart';
import 'package:lostandfound/features/search/widget/filter_button.dart';
import 'package:lostandfound/features/search/widget/search_filde.dart';
import 'package:lostandfound/features/search/widget/type_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
      init: SearchPageController(),
      builder: (controller) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // تم التعديل هنا لضمان عدم التمدد اللانهائي
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FilterButton(
                        isClick: controller.isClickFilter,
                        onTap: () => _showFilterBottomSheet(controller),
                      ),
                    ),
                    Expanded(
                      child: MySearchFilde(
                        onChanged: (val) {
                          controller.searchfilde = val;
                        },
                        submitted: (val) {
                          final text = val.trim();

                          if (text.isNotEmpty) {
                            controller.getItems();
                          }
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                SearchActiveFilters(
                  filters: controller.activeFilters,
                  onRemove: (filter) => controller.removeFilter(filter),
                ),

                // تم تغيير Expanded إلى Flexible لحل مشكلة الـ unbounded height
                Flexible(
                  child: RefreshIndicator(
                    onRefresh: () => controller.getItems(),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0, top: 5),
                      child: _buildBody(controller),
                    ),
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

  void _showFilterBottomSheet(SearchPageController controller) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: GetBuilder<SearchPageController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Get.theme.cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Center(
                  child: Text(
                    "search filter".tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "choose type".tr,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTypeCard(
                      color: Colors.red,
                      text: "lost".tr,
                      icon: Icons.search,
                      isselected: controller.tempIsClickLost,
                      ontap: () => controller.toggleType("lost"),
                    ),
                    MyTypeCard(
                      color: Colors.green,
                      text: "found".tr,
                      icon: Icons.add_box_outlined,
                      isselected: controller.tempIsClickFound,
                      ontap: () => controller.toggleType("found"),
                    ),
                  ],
                ),

                const SizedBox(height: 17),

                MyDropdownList(
                  selectedCategory: controller.tempSelectedCategory,
                  text: "category".tr,
                  hint: "choose from list".tr,
                  items: controller.dropdownItems,
                  onChanged: (value) => controller.updateTempCategory(value),
                ),

                const SizedBox(height: 22),

                Mybutton(
                  text: "apply filter".tr,
                  onTap: () {
                    if (controller.tempIsClickFound ||
                        controller.tempIsClickLost ||
                        controller.tempSelectedCategory != null) {
                      controller.applyFilters();
                      Get.back();
                    } else {
                      Get.back();
                    }
                  },
                ),

                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
      isScrollControlled: true,
    );
  }
}

Widget _buildBody(SearchPageController controller) {
  switch (controller.state) {
    case HomeState.initial:
      return ListView(
        shrinkWrap: true, // تم الإضافة هنا
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [SizedBox(height: 200)],
      );

    case HomeState.loading:
      return ListView(
        shrinkWrap: true, // تم الإضافة هنا
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 200),
          Center(child: CircularProgressIndicator()),
        ],
      );

    case HomeState.empty:
      return ListView(
        shrinkWrap: true, // تم الإضافة هنا
        physics: const AlwaysScrollableScrollPhysics(),
        children: [const SizedBox(height: 200), _buildEmptyState()],
      );

    case HomeState.error:
      return ListView(
        shrinkWrap: true, // تم الإضافة هنا
        physics: const AlwaysScrollableScrollPhysics(),
        children: [const SizedBox(height: 200), _buildErrorState(controller)],
      );

    case HomeState.success:
      return Scrollbar(
        controller: controller.scrollController,
        interactive: true,
        thickness: 4,
        radius: const Radius.circular(10),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true, // مهم جداً لحل مشكلة الأبعاد
          controller: controller.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: controller.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    date: item.dateReported.toString(),
                    status: item.reportType,
                    statusColor: item.reportType == 1
                        ? Colors.redAccent
                        : Colors.greenAccent,
                    image: item.imagePath,
                  ),
                );
              },
              child: OfferCard(
                title: item.itemName,
                date: item.dateReported.toString(),
                status: item.reportType,
                statusColor: item.reportType == 1
                    ? Colors.redAccent
                    : Colors.greenAccent,
                imageUrl: item.imagePath,
              ),
            );
          },
        ),
      );
  }
}

// الدوال الفرعية _buildEmptyState و _buildErrorState تبقى كما هي دون تغيير
Widget _buildEmptyState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.inbox_outlined, size: 70, color: Colors.grey),
        const SizedBox(height: 12),
        Text(
          "there are not post at the moment".tr,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    ),
  );
}

Widget _buildErrorState(SearchPageController controller) {
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
        Text("Click to retry".tr, style: const TextStyle(color: Colors.grey)),
      ],
    ),
  );
}
