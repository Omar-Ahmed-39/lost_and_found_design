import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/function/imagepick.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/features/home/done.dart';
import 'package:lostandfound/features/report/widget/image_picker_card.dart';

class ReportLostPage extends StatefulWidget {
  ReportLostPage({super.key});

  @override
  State<ReportLostPage> createState() => _ReportLostPageState();
}

class _ReportLostPageState extends State<ReportLostPage> {
  String? selectedCategory;
  File? file;

  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: "electronics", child: Text("electronics".tr)),
    DropdownMenuItem(value: "wallet", child: Text("wallet".tr)),
    DropdownMenuItem(value: "keys", child: Text("keys".tr)),
    DropdownMenuItem(value: "bag", child: Text("bag".tr)),
    DropdownMenuItem(value: "other", child: Text("other".tr)),
  ];

  String? selectedCategory1;

  List<DropdownMenuItem<String>> items1 = [
    DropdownMenuItem(value: "campus yard", child: Text("campus yard".tr)),
    DropdownMenuItem(value: "hall", child: Text("hall".tr)),
    DropdownMenuItem(value: "prayer room", child: Text("prayer room".tr)),
    DropdownMenuItem(value: "other", child: Text("other".tr)),
  ];

  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  late GlobalKey<FormState> formstate;

  @override
  void initState() {
    formstate = GlobalKey();

    nameController = TextEditingController();
    brandController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    brandController.dispose();
    descController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  void handlesend() {
    if (formstate.currentState!.validate()) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => DonePage(
            text: "report received for review".tr,
          ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails("report lost item".tr),
      body: Form(
        key: formstate,
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 15),

                MyInputField(
                  hint: "write name".tr,
                  title: "item name".tr,
                  controller: nameController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                SizedBox(height: 15),

                MyDropdownList(
                  validator: (val) => MyValidators.validateDropdown(val),
                  selectedCategory: selectedCategory,
                  text: "category".tr,
                  hint: "choose from list".tr,
                  items: items,
                  onChanged: (value) {
                    selectedCategory = value!;
                  },
                ),

                SizedBox(height: 15),

                MyInputField(
                  hint: "write color brand".tr,
                  title: "color brand".tr,
                  controller: brandController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                SizedBox(height: 15),

                MyInputField(
                  isMultiline: true,
                  maxLines: 3,
                  hint: "describe item".tr,
                  title: "item description".tr,
                  controller: descController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                SizedBox(height: 15),

                MyInputField(
                  hint: "write date".tr,
                  title: "lost date".tr,
                  controller: dateController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                SizedBox(height: 15),

                MyInputField(
                  hint: "write time".tr,
                  title: "lost time".tr,
                  controller: timeController,
                  val: (val) => MyValidators.validateRequired(val),
                ),

                SizedBox(height: 15),

                MyDropdownList(
                  validator: (val) => MyValidators.validateDropdown(val),
                  selectedCategory: selectedCategory1,
                  text: "location".tr,
                  hint: "choose from list".tr,
                  items: items1,
                  onChanged: (value) {
                    selectedCategory1 = value!;
                  },
                ),

                SizedBox(height: 15),

                ImagePickerCard(
                  title: "add image".tr,
                  file: file,
                  onTap: () async {
                    file = await MyImagePicker();
                    setState(() {});
                  },
                ),

                SizedBox(height: 35),
                Mybutton(
                  text: "send".tr,
                  onTap: () {
                    handlesend();
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