import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
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
                    const Expanded(child: MySearchFilde()),
                  ],
                ),
                const SizedBox(height: 15),
                SearchActiveFilters(
                  filters: controller.activeFilters,
                  onRemove: (filter) => controller.removeFilter(filter),
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                      color: Colors.grey[400],
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
                  onTap: () => controller.applyFilters(),
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