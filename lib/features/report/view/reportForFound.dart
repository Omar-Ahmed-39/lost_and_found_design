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
    // حقن الكنترولر
    final ReportFoundController controller =
        Get.put(ReportFoundController());

    return Scaffold(
      appBar: MyAppbarWithoutdetails(
        "report found item".tr,
      ),
      body: Form(
        key: controller.formstate,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),

                /// Item Name
                MyInputField(
                  hint: "write name".tr,
                  title: "item name".tr,
                  controller: controller.nameController,
                  val: (val) =>
                      MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                /// Category Dropdown
                GetBuilder<ReportFoundController>(
                  builder: (controller) => MyDropdownList<int>(
                    validator: (val) {
                      if (val == null) {
                        return "Please choose a category";
                      }
                      return null;
                    },
                    selectedCategory:
                        controller.selectedCategoryId,
                    text: "category".tr,
                    hint: "choose from list".tr,
                    items: controller.categoryItems,
                    onChanged: controller.changeCategory,
                  ),
                ),

                const SizedBox(height: 15),

                /// Brand / Color
                MyInputField(
                  hint: "write color brand".tr,
                  title: "color brand".tr,
                  controller: controller.brandController,
                  val: (val) =>
                      MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                /// Description
                MyInputField(
                  isMultiline: true,
                  maxLines: 3,
                  hint: "describe item".tr,
                  title: "item description".tr,
                  controller: controller.descController,
                  val: (val) =>
                      MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                /// Lost Date
                MyInputField(
                  hint: "write date".tr,
                  title: "lost date".tr,
                  controller: controller.dateController,
                  val: (val) =>
                      MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                /// Lost Time
                MyInputField(
                  hint: "write time".tr,
                  title: "lost time".tr,
                  controller: controller.timeController,
                  val: (val) =>
                      MyValidators.validateRequired(val),
                ),

                const SizedBox(height: 15),

                /// Location Dropdown
                GetBuilder<ReportFoundController>(
                  builder: (controller) => MyDropdownList<int>(
                    validator: (val) {
                      if (val == null) {
                        return "Please choose a location";
                      }
                      return null;
                    },
                    selectedCategory:
                        controller.selectedLocationId,
                    text: "location".tr,
                    hint: "choose from list".tr,
                    items: controller.locationItems,
                    onChanged: controller.changeLocation,
                  ),
                ),

                const SizedBox(height: 15),

                /// Image Picker
                GetBuilder<ReportFoundController>(
                  builder: (controller) => ImagePickerCard(
                    title: "add image".tr,
                    file: controller.file,
                    onTap: controller.pickImage,
                  ),
                ),

                const SizedBox(height: 35),

                /// Submit Button
                Mybutton(
                  text: "send".tr,
                  onTap: controller.submitReport,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

