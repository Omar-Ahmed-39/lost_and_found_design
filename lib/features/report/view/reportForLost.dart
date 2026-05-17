import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/report/controller/report_lost_controller.dart';
import 'package:lostandfound/features/report/view/widget/image_picker_card.dart';

class ReportLostPage extends StatelessWidget {
  const ReportLostPage({super.key});

  @override
  Widget build(BuildContext context) {
    // حقن وتجهيز كنترولر البلاغات عن مفقود داخل الصفحة
    final ReportLostController controller = Get.put(ReportLostController());

    return Scaffold(
      appBar: MyAppbarWithoutdetails("report lost item".tr),
      body: Form(
        key: controller.formstate,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),

                MyInputField(
                  hint: "write name".tr,
                  title: "item name".tr,
                  controller: controller.nameController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                // تحديث قائمة التصنيفات بشكل منفصل عند تغييرها
                GetBuilder<ReportLostController>(
                  builder: (controller) => MyDropdownList(
                    validator: (val) => MyValidators.validateDropdown(val),
                    selectedCategory: controller.selectedCategory,
                    text: "category".tr,
                    hint: "choose from list".tr,
                    items: controller.items,
                    onChanged: (value) {
                      controller.changeCategory(value!);
                    },
                  ),
                ),

                const SizedBox(height: 15),

                MyInputField(
                  hint: "write color brand".tr,
                  title: "color brand".tr,
                  controller: controller.brandController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                MyInputField(
                  isMultiline: true,
                  maxLines: 3,
                  hint: "describe item".tr,
                  title: "item description".tr,
                  controller: controller.descController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                MyInputField(
                  hint: "write date".tr,
                  title: "lost date".tr,
                  controller: controller.dateController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                MyInputField(
                  hint: "write time".tr,
                  title: "lost time".tr,
                  controller: controller.timeController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                // تحديث قائمة الموقع بشكل منفصل
                GetBuilder<ReportLostController>(
                  builder: (controller) => MyDropdownList(
                    validator: (val) => MyValidators.validateDropdown(val),
                    selectedCategory: controller.selectedCategory1,
                    text: "location".tr,
                    hint: "choose from list".tr,
                    items: controller.items1,
                    onChanged: (value) {
                      controller.changeLocation(value!);
                    },
                  ),
                ),

                const SizedBox(height: 15),

                // تحديث بطاقة عرض الصورة فقط عند التقاطها
                GetBuilder<ReportLostController>(
                  builder: (controller) => ImagePickerCard(
                    title: "add image".tr,
                    file: controller.file,
                    onTap: () {
                      controller.pickImage();
                    },
                  ),
                ),

                const SizedBox(height: 35),

                Mybutton(
                  text: "send".tr,
                  onTap: () {
                    controller.handleSend();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}