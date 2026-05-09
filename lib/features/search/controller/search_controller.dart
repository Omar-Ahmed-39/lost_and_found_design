import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/features/home/model/report_model.dart';

enum HomeState { initial, loading, success, empty, error }

class SearchPageController extends GetxController {
  // المتغيرات الأساسية
  String? selectedCategory;
  String? searchfilde;

  int? reportTypeId;
  int? selectedCategoryId;

  List<String> activeFilters = [];

  bool isClickFilter = false;
 late TextEditingController controller;

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
  ApiConsumer api = DioConsumer(dio: Dio());
  HomeState state = HomeState.initial;
  List<ItemData> items = [];

  int currentPage = 1;
  final int pageSize = 15;
  bool isPaginating = false;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    controller=TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }
  @override
  void onClose() {
    scrollController.dispose();
    controller.dispose();
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent * 0.9) {
      if (!isPaginating && state == HomeState.success) {
        getMoreItems();
      }
    }
  }

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
    if (tempIsClickFound) {
      reportTypeId = 2;
      activeFilters.add("موجود");
    }
    if (tempIsClickLost) {
      reportTypeId = 1;

      activeFilters.add("مفقود");
    }
    if (tempSelectedCategory != null) activeFilters.add(tempSelectedCategory!);

    isClickFilter = activeFilters.isNotEmpty;
    selectedCategory = tempSelectedCategory; // حفظ التصنيف المختار

    update();
    Get.back();
    getItems();
  }

  // حذف فلتر واحد من الشيبس (Chips)
  void removeFilter(String filter) {
    activeFilters.remove(filter);
    if(filter== "موجود"||filter=="مفقود"){
      reportTypeId=null;
    }else{ selectedCategoryId=null;}
    
    if (activeFilters.isEmpty) {
      isClickFilter = false;
      // تصفير القيم المؤقتة أيضاً
      tempIsClickLost = false;
      tempIsClickFound = false;
      tempSelectedCategory = null;
    }
    getItems();
    update();
  }

  Future<void> getItems() async {
    if (reportTypeId == null && selectedCategoryId == null&& searchfilde==null) {
      items = [];              // تصفير القائمة
      state = HomeState.initial; // إعادة الحالة للوضع الأولي
      update();                // تحديث الواجهة
      return;                  // الخروج من الدالة فوراً
    }
    currentPage = 1;
    state = HomeState.loading;

    update();

    try {
      final response = await api.get(
        EndPoint.getReportsEndPoint(
          search: searchfilde,
          categoryId: selectedCategoryId,
          reportType: reportTypeId,
          pageNumber: currentPage,
          pageSize: pageSize,
        ),
      );
      final itemsResponse = ItemsResponse.fromJson(response);
      if (itemsResponse.succeeded) {
        items = itemsResponse.data;
        state = items.isEmpty ? HomeState.empty : HomeState.success;
      } else {
        state = HomeState.error;
      }
    } on ServerException catch (e) {
      state = HomeState.error;
      Get.snackbar(
        e.erorrModel.title,
        e.erorrModel.erorrmessage,
        animationDuration: Duration(seconds: 3),
      );
    }
    update();
  }

  Future<void> getMoreItems() async {
    isPaginating = true;
    update();
    try {
      currentPage++;
      final response = await api.get(EndPoint.getReportsEndPoint(
        pageNumber: currentPage,
        pageSize: pageSize,
      ));
      final itemsResponse = ItemsResponse.fromJson(response);
      if (itemsResponse.succeeded && itemsResponse.data.isNotEmpty) {
        items.addAll(itemsResponse.data);
      }
    }on ServerException catch (e) {
  Get.snackbar(e.erorrModel.title, e.erorrModel.erorrmessage,  animationDuration: Duration(seconds: 3)
);    } finally {
      isPaginating = false;
      update();
    }
  }
}
