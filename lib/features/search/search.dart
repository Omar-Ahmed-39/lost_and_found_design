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

  // استخدام Get.bottomSheet بدلاً من showModalBottomSheet
  void _showFilterBottomSheet(SearchPageController controller) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: GetBuilder<SearchPageController>( // لإعادة بناء محتوى البوتوم شيت فقط
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 40, height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text("فلترة البحث", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                const Text("اختر النوع", textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTypeCard(
                      color: Colors.red,
                      text: "مفقود",
                      icon: Icons.search,
                      isselected: controller.tempIsClickLost,
                      ontap: () => controller.toggleType("lost"),
                    ),
                    MyTypeCard(
                      color: Colors.green,
                      text: "موجود",
                      icon: Icons.add_box_outlined,
                      isselected: controller.tempIsClickFound,
                      ontap: () => controller.toggleType("found"),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                MyDropdownList(
                  selectedCategory: controller.tempSelectedCategory,
                  text: "التصنيف",
                  hint: "اختر من القائمة",
                  items: controller.dropdownItems,
                  onChanged: (value) => controller.updateTempCategory(value),
                ),
                const SizedBox(height: 22),
                Mybutton(
                  text: "تطبيق الفلتر",
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