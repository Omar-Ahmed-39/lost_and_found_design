import 'package:flutter/material.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // حساب ارتفاع الصورة ليكون 2 من 5 من ارتفاع الشاشة
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = screenHeight * (2 / 5);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // لون خلفية هادئ
      body: Directionality(
        textDirection: TextDirection.rtl, // المحاذاة من اليمين لليسار
        child: CustomScrollView(
          slivers: [
            // الأبار المرن الذي يتغير لونه
            SliverAppBar(
              expandedHeight: appBarHeight,
              pinned: true, // يظل ثابتاً في الأعلى
              elevation: 0,
              backgroundColor: Colors.white, // اللون عند النزول
              leading: _buildCircleButton(context, Icons.arrow_back_ios_new, () => Navigator.pop(context)),
              actions: [
                _buildCircleButton(context, Icons.share, () {}),
                const SizedBox(width: 16),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  MyAppImage.bag, // صورتك هنا
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // محتوى الصفحة (التفاصيل)
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
                    // العنوان والحالة (مفقود/موجود)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "شنطة ظهر سوداء",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "مفقود",
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // شبكة المعلومات المنظمة
                    _buildDetailItem(Icons.category_outlined, "النوع", "مقتنيات شخصية"),
                    _buildDetailItem(Icons.location_on_outlined, "مكان الفقد", "مبنى كلية الهندسة - الدور الثاني"),
                    _buildDetailItem(Icons.calendar_month_outlined, "تاريخ الفقد", "18 أبريل 2026"),
                    
                    const Divider(height: 40),

                    const Text(
                      "الوصف الإضافي",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "تم فقدان الشنطة بالقرب من المصلى، تحتوي على كتب جامعية وجهاز لابتوب. يرجى التواصل في حال العثور عليها.",
                      style: TextStyle(color: Colors.grey, height: 1.6, fontSize: 16),
                    ),
                    
                    const SizedBox(height: 400), // مساحة للسكرول
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // زر التواصل ثابت في الأسفل
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: const Text(
            "تواصل مع صاحب الإعلان",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // ودجت لعرض تفاصيل المعلومات بشكل منظم
  Widget _buildDetailItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  // ودجت الأزرار الدائرية مع معالجة الشفافية
  Widget _buildCircleButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5), // نصف شفاف في البداية
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 22, color: Colors.black87),
        ),
      ),
    );
  }
}