import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  // المتغيرات الأساسية
  String? selectedCategory;
  List<String> activeFilters = [];
  bool isClickFilter = false;

  // متغيرات مؤقتة للـ BottomSheet (لكي لا يتم التطبيق إلا عند ضغط زر "تطبيق")
  bool tempIsClickLost = false;
  bool tempIsClickFound = false;
  String? tempSelectedCategory;

  final List<DropdownMenuItem<String>> dropdownItems = [
    const DropdownMenuItem(value: 'الكترونيات', child: Text('الكترونيات')),
    const DropdownMenuItem(value: 'محفظة', child: Text('محفظة')),
    const DropdownMenuItem(value: 'مفاتيح', child: Text('مفاتيح')),
    const DropdownMenuItem(value: 'شنطة', child: Text('شنطة')),
    const DropdownMenuItem(value: 'أخرى', child: Text('أخرى')),
  ];

  // وظائف اختيار النوع داخل المودال
  void toggleType(String type) {
    if (type == "lost") {
      tempIsClickLost = true;
      tempIsClickFound = false;
    } else {
      tempIsClickLost = false;
      tempIsClickFound = true;
    }
    update(); // لتحديث الـ BottomSheet فقط
  }

  void updateTempCategory(String? value) {
    tempSelectedCategory = value;
    update();
  }

  // تطبيق الفلاتر النهائية
  void applyFilters() {
    activeFilters.clear();
    if (tempIsClickFound) activeFilters.add("موجود");
    if (tempIsClickLost) activeFilters.add("مفقود");
    if (tempSelectedCategory != null) activeFilters.add(tempSelectedCategory!);

    isClickFilter = activeFilters.isNotEmpty;
    selectedCategory = tempSelectedCategory; // حفظ التصنيف المختار
    
    update();
    Get.back(); // إغلاق البوتوم شيت
  }

  // حذف فلتر واحد من الشيبس (Chips)
  void removeFilter(String filter) {
    activeFilters.remove(filter);
    if (activeFilters.isEmpty) {
      isClickFilter = false;
      // تصفير القيم المؤقتة أيضاً
      tempIsClickLost = false;
      tempIsClickFound = false;
      tempSelectedCategory = null;
    }
    update();
  }
}