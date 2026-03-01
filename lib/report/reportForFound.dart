import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lostandfound/core/function/imagepick.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/validator/validator.dart';
import 'package:lostandfound/home/done.dart';
import 'package:lostandfound/report/widget/image_picker_card.dart';

class ReportFoundPage extends StatefulWidget {
  const ReportFoundPage({super.key});

  @override
  State<ReportFoundPage> createState() => _ReportFoundPageState();
}

class _ReportFoundPageState extends State<ReportFoundPage> {
 String? selectedCategory;
  String? selectedCategory1;
  File? file;

  // ✅ Controllers
  late TextEditingController nameController;
  late TextEditingController brandController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: 'الكترونيات', child: Text('الكترونيات')),
    DropdownMenuItem(value: 'محفظة', child: Text('محفظة')),
    DropdownMenuItem(value: 'مفاتيح', child: Text('مفاتيح')),
    DropdownMenuItem(value: 'شنطة', child: Text('شنطة')),
    DropdownMenuItem(value: 'أخرى', child: Text('أخرى')),
  ];

  List<DropdownMenuItem<String>> items1 = [
    DropdownMenuItem(value: 'الكترونيات', child: Text('حرم الجامع')),
    DropdownMenuItem(value: 'محفظة', child: Text('قاعة')),
    DropdownMenuItem(value: 'مفاتيح', child: Text('المصلى')),
    DropdownMenuItem(value: 'أخرى', child: Text('أخرى')),
  ];

  late GlobalKey<FormState> formstate;

  @override
  void initState() {
    formstate = GlobalKey();

    // ✅ تهيئة الكنترولرز
    nameController = TextEditingController();
    brandController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // ✅ التخلص من الكنترولرز
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
          builder: (context) =>
              DonePage(text: "تم استلام البلاغ للمراجعة"),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails("ابلاغ عن موجود"),
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
                  hint: "اكتب الاسم",
                  title: "اسم الغرض",
                  controller: nameController,   // ✅ ربط الكنترولر
                  val: (val) => MyValidators.validateRequired(val),
                ),
            
                SizedBox(height: 15),
            
                MyDropdownList(
                  validator: (val) => MyValidators.validateDropdown(val),
                  selectedCategory: selectedCategory,
                  text: "التصنيف",
                  hint: "اختر من القاءمة",
                  items: items,
                  onChanged: (value) {
                    selectedCategory = value!;
                  },
                ),
            
                SizedBox(height: 15),
            
                MyInputField(
                  hint: "اكتب اللون/الماركة",
                  title: "اللون/الماركة",
                  controller: brandController,  // ✅
                  val: (val) => MyValidators.validateRequired(val),
                ),
            
                SizedBox(height: 15),
            
                MyInputField(
                  isMultiline: true,
                  maxLines: 3,
                  hint: "قم بوصف الغرض",
                  title: "وصف الغرض",
                  controller: descController,   // ✅
                  val: (val) => MyValidators.validateRequired(val),
                ),
            
                SizedBox(height: 15),
            
                MyInputField(
                  hint: "اكتب التاريخ",
                  title: "تاريخ الفقد",
                  controller: dateController,   // ✅
                  val: (val) => MyValidators.validateRequired(val),
                ),
            
                SizedBox(height: 15),
            
                MyInputField(
                  hint: "اكتب الوقت",
                  title: " وقت الفقد",
                  controller: timeController,   // ✅
                  val: (val) => MyValidators.validateRequired(val),
                ),
            
                SizedBox(height: 15),
            
                MyDropdownList(
                   validator: (val) => MyValidators.validateDropdown(val),
                  selectedCategory: selectedCategory1,
                  text: "الموقع",
                  hint: "اختر من القاءمة",
                  items: items1,
                  onChanged: (value) {
                    selectedCategory1 = value!;
                  },
                ),
            
                SizedBox(height: 15),
            
                ImagePickerCard(
                  title: "اضف صورة",
                  file: file,
                  onTap: () async {
                    file = await MyImagePicker();
                    setState(() {});
                  },
                ),
            
                SizedBox(height: 35),
                 Mybutton(
                  text: "ارسال",
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

