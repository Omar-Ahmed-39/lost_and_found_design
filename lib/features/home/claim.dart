import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/home/done.dart';

class ClaimPage extends StatelessWidget {
  const ClaimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails("ownership proof".tr),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            MyInputFieldwithdetails(
              hint: "upload proof hint".tr,
              title: "upload proof".tr,
              details: "id card passport".tr,
            ),
            SizedBox(
              height: 15,
            ),
            MyInputField(
              hint: "write your description".tr,
              title: "distinctive mark description".tr,
            ),
            SizedBox(
              height: 35,
            ),
            Mybutton(
              text: "upload".tr,
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => DonePage(
                      text: "claim received for review".tr,
                    ),
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}