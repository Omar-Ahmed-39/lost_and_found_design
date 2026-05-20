import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/features/report/view/reportForFound.dart';
import 'package:lostandfound/features/report/view/reportForLost.dart';
import 'package:lostandfound/features/report/view/widget/reportCard.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails("report".tr),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MyReportCard(
                color: Colors.red,
                icon: Icons.search,
                text: "report lost item".tr,
                ontap: () {
                  
                                    Get.to(()=>ReportLostPage());

                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: MyReportCard(
                color: Colors.green,
                icon: Icons.add_box_outlined,
                text: "report found item".tr,
                ontap: () {
                  Get.to(()=>ReportFoundPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}