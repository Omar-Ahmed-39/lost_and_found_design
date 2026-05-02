import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';

class ThemeController extends GetxController{
ThemeMode get initialTheme => CacheHelper.getData(key: "theme") == "dark" 
    ? ThemeMode.dark 
    : ThemeMode.light;
    // دالة التغيير بين الثيمات
  void changeTheme() {
    // Get.isDarkMode ترجع true إذا كان التطبيق حالياً في الوضع المظلم
    if (Get.isDarkMode) {
      // إذا كان مظلم -> حوله لفاتح
      Get.changeThemeMode(ThemeMode.light);
      CacheHelper.saveData(key: "theme", value: "light");
    } else {
      // إذا كان فاتح -> حوله لمظلم
      Get.changeThemeMode(ThemeMode.dark );
      CacheHelper.saveData(key: "theme", value: "dark");
    }
  }


}