import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/features/report/reportForFound.dart';
import 'package:lostandfound/features/report/reportForLost.dart';
import 'package:lostandfound/features/report/widget/reportCard.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails("ابلاغ"),
      body: Container(
        
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      Expanded(
        child: MyReportCard(color: Colors.red,icon: Icons.search,text: "ابلاغ عن مفقود",
        ontap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReportLostPage(),));
        },)),
            SizedBox(height: 20,),
            Expanded(
        child:MyReportCard(color: Colors.green,icon: Icons.add_box_outlined,text: "ابلاغ عن موجود",
        ontap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReportFoundPage(),));
        },)), ],),),
    );
  }
}

