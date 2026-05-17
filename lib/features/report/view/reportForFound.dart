import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/report/controller/report_found_controller.dart';
import 'package:lostandfound/features/report/view/widget/image_picker_card.dart';

class ReportFoundPage extends StatelessWidget {
  const ReportFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    // حقن وتجهيز الكنترولر في الصفحة
    final ReportFoundController controller = Get.put(ReportFoundController());

    return Scaffold(
      appBar: MyAppbarWithoutdetails("report found item".tr),
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

                // استخدام GetBuilder لتحديث القائمة المنسدلة الأولى فقط عند التغيير
                GetBuilder<ReportFoundController>(
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

                // استخدام GetBuilder لتحديث القائمة المنسدلة الثانية
                GetBuilder<ReportFoundController>(
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

                // استخدام GetBuilder لتحديث واجهة اختيار الصورة فور اختيارها
                GetBuilder<ReportFoundController>(
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