import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lostandfound/core/function/imagepick.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/home/done.dart';
import 'package:lostandfound/report/widget/image_picker_card.dart';

class ReportFoundPage extends StatefulWidget {
  const ReportFoundPage({super.key});

  @override
  State<ReportFoundPage> createState() => _ReportFoundPageState();
}

class _ReportFoundPageState extends State<ReportFoundPage> {
  String? selectedCategory;
  File? file;
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: 'الكترونيات', child: Text('الكترونيات')),
    DropdownMenuItem(value: 'محفظة', child: Text('محفظة')),
    DropdownMenuItem(value: 'مفاتيح', child: Text('مفاتيح')),
    DropdownMenuItem(value: 'شنطة', child: Text('شنطة')),
    DropdownMenuItem(value: 'أخرى', child: Text('أخرى')),
  ];
  String? selectedCategory1;
  List<DropdownMenuItem<String>> items1 = [
    DropdownMenuItem(value: 'الكترونيات', child: Text('حرم الجامع')),
    DropdownMenuItem(value: 'محفظة', child: Text('قاعة')),
    DropdownMenuItem(value: 'مفاتيح', child: Text('المصلى')),
    DropdownMenuItem(value: 'أخرى', child: Text('أخرى')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails("ابلاغ عن موجود"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 15),
            MyInputField(hint: "اكتب الاسم", title: "اسم الغرض"),
            SizedBox(height: 15),
            MyDropdownList(
              selectedCategory: selectedCategory,
              text: "التصنيف",
              hint: "اختر من القاءمة",
              items: items,
              onChanged: (value) {
                selectedCategory = value!;
              },
            ),

            SizedBox(height: 15),
            MyInputField(hint: "اكتب اللون/الماركة", title: "اللون/الماركة"),
            SizedBox(height: 15),
            MyInputField(hint: "قم بوصف الغرض", title: "وصف الغرض"),
            SizedBox(height: 15),
            MyInputField(hint: "اكتب التاريخ", title: "تاريخ الفقد"),
            SizedBox(height: 15),
            MyInputField(hint: "اكتب الوقت", title: " وقت الفقد"),
            SizedBox(height: 15),
            MyDropdownList(
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
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) =>
                        DonePage(text: "تم استلام البلاغ للمراجعة"),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

