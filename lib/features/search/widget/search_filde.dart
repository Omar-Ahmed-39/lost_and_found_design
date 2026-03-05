import 'package:flutter/material.dart';

class MySearchFilde extends StatelessWidget {
  const MySearchFilde({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
    
      decoration: InputDecoration(
        hintText: "البحث",
        hintStyle: TextStyle(fontWeight: FontWeight.w200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), // الاستدارة
          borderSide: BorderSide.none,
        ), // يخلي البوردر شفاف,
        fillColor: Colors.grey[200],
        filled: true,
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
