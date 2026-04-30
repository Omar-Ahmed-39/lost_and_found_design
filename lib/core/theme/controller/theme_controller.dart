import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';

class ThemeController extends GetxController{
ThemeData get initialTheme => CacheHelper.getData(key: "theme") == "dark" 
    ? ThemeData.dark() 
    : ThemeData.light();
    // دالة التغيير بين الثيمات
  void changeTheme() {
    // Get.isDarkMode ترجع true إذا كان التطبيق حالياً في الوضع المظلم
    if (Get.isDarkMode) {
      // إذا كان مظلم -> حوله لفاتح
      Get.changeTheme(ThemeData.light());
      CacheHelper.saveData(key: "theme", value: "light");
    } else {
      // إذا كان فاتح -> حوله لمظلم
      Get.changeTheme(ThemeData.dark() );
      CacheHelper.saveData(key: "theme", value: "dark");
    }
  }


}