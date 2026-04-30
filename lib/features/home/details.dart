import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/home/claim.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;
  final String image;

  const DetailsPage({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    // حساب ارتفاع الصورة ليكون 2 من 5 من ارتفاع الشاشة
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = screenHeight * (2 / 5);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            // الأبار المرن مع صورتك الديناميكية
            SliverAppBar(
              expandedHeight: appBarHeight,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              // زر الرجوع باستخدام GetX
              leading: _buildCircleButton(
                context,
                Icons.arrow_back_ios_new,
                () => Get.back(),
              ),
              actions: [
                _buildCircleButton(context, Icons.share, () {
                  // منطق المشاركة هنا
                }),
                const SizedBox(width: 16),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  image,
                  fit: BoxFit.cover,
                  // معالجة الخطأ في تحميل الصورة
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(MyAppImage.imagebroken, fit: BoxFit.cover),
                ),
              ),
            ),

            // محتوى التفاصيل
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان والحالة مفقود/موجود
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // شبكة المعلومات المنظمة بناءً على بياناتك
                    _buildDetailItem(Icons.info_outline, "status".tr, status),
                    _buildDetailItem(Icons.calendar_month_outlined, "date".tr, date),
                    _buildDetailItem(
                      Icons.location_on_outlined,
                      "location".tr,
                      "location will be determined later".tr,
                    ),

                    const Divider(height: 40),

                    Text(
                      "item description".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "item registered description",
                      style: const TextStyle(
                        color: Colors.grey,
                        height: 1.6,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // زر مطالبة ثابت في الأسفل
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            )
          ],
        ),
        child: Mybutton(
          text: "claim".tr,
          onTap: () {
            Get.to(() => const ClaimPage());
          },
        ),
      ),
    );
  }

  // ودجت لعرض تفاصيل المعلومات بشكل منظم
  Widget _buildDetailItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blueAccent, size: 24),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ودجت الأزرار الدائرية الشفافة في الأعلى
  Widget _buildCircleButton(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: Colors.white),
        ),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'package:lostandfound/core/constsnt/image_constant.dart';
// import 'package:lostandfound/core/shared/appbar.dart';
// import 'package:lostandfound/core/shared/form.dart';
// import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
// import 'package:lostandfound/core/theme/app_theme.dart';
// import 'package:lostandfound/features/home/claim.dart';
// import 'package:lostandfound/features/home/done.dart';

// class DetailsPage extends StatelessWidget {
//   final String title;
//   final String date;
//   final String status;
//   final Color statusColor;
//   final String image;

//   const DetailsPage({super.key, required this.title, required this.date, required this.status, required this.statusColor, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppbarWithoutdetails(title),
//        body: Container(
//         margin: EdgeInsets.symmetric(horizontal: 10),
//          child: ListView(children: [
//           const SizedBox(height: 10,),
//           ClipRRect(
//             borderRadius:BorderRadius.all(Radius.circular(19)) ,
//             child: Stack(children: [Container(width: double.infinity,
//              child: Image.network(image,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) =>
//                    Image.asset(MyAppImage.imagebroken,fit: BoxFit.cover) ,)),
//               Positioned(
//               top: 10,
//               right: 10,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: statusColor,
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 child: Text(
//                   status,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ),
//              ])),
           
//            SizedBox(height: 10,),
//            ClipRRect(
//                borderRadius:BorderRadius.all(Radius.circular(19)) ,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               color: Colors.white,
//               child: Column(children: [
//               Text("تفاصيل الغرض",style: MyTextStyle.meduimtitle(),),
//              Align(
//               alignment: Alignment.centerRight,
//                child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [
//                  Text("الحالة: $status",style: MyTextStyle.subtitel(),),
//                  Text("التاريخ: $date",style: MyTextStyle.subtitel(),),
//                  Text("العنوان: $status",style: MyTextStyle.subtitel(),),
                 

//                ],),
//              ),
   
         
//             ],),)),
//               SizedBox(height: 20,),
//              Mybutton(text:"مطالبة",onTap: () {
//                 // Navigator.of(context).pushAndRemoveUntil(
//                 //           MaterialPageRoute(
//                 //             builder: (context) =>DonePage() ),(route) => false,);
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ClaimPage() ,));
                      
//              },),
//          SizedBox(height: 50,)
//          ],),
//        )

//     );
//   }
// }