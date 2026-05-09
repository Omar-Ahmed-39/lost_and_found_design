import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearchFilde extends StatelessWidget {
  void Function(String)? submitted;
   MySearchFilde({
    super.key,
    this.submitted
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      onFieldSubmitted:submitted ,
    
      decoration: InputDecoration(
        hintText: "البحث",
        hintStyle: TextStyle(fontWeight: FontWeight.w200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), // الاستدارة
          borderSide: BorderSide.none,
        ), // يخلي البوردر شفاف,
        fillColor:Get.theme.cardColor,
        filled: true,
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
