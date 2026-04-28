import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';

class MyLocalController extends GetxController{
  Locale initialLang=CacheHelper.getData(key: "lang")== null? Locale('en', 'US'):Locale(CacheHelper.getData(key: "lang"));
  void changeLang( ){
    
    if (Get.locale?.languageCode == 'ar') {
      CacheHelper.saveData(key: "lang", value: 'en');
    // إذا كانت عربي، حولها لإنجليزي
    Get.updateLocale(const Locale('en', 'US'));

    
  } else {
          CacheHelper.saveData(key: "lang", value: 'ar');

    // إذا كانت إنجليزي (أو أي لغة أخرى)، حولها لعربي
    Get.updateLocale(const Locale('ar', 'SA'));
  }
  }
}