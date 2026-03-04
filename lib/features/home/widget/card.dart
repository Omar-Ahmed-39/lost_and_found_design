import 'package:flutter/material.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;
  final String imageUrl;

  const OfferCard({
    required this.title,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 14,
            offset: Offset(0, 6),
            color: Color(0x22000000),
          ),
        ],
      ),
      child: Stack(
        children: [
          // الصورة
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder:  (context, error, stackTrace) =>
                   Image.asset(MyAppImage.imagebroken,fit: BoxFit.cover,)
            ),
          ),

          // تدرج خفيف أسفل
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 90,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0x99000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ),

          // الحالة (مفقود/موجود)
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                status,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // النصوص أسفل
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child:Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  mainAxisSize: MainAxisSize.min,
  children: [
    Text(
      title,
      textAlign: TextAlign.right,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),

    const SizedBox(height: 6),

    Row(
      mainAxisSize: MainAxisSize.min, // ⭐ أهم سطر يمنع التمدد
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8, // أصغر
            vertical: 4,   // أصغر
          ),
          decoration: BoxDecoration(
            color: const Color(0x66FFFFFF),
            borderRadius: BorderRadius.circular(10), // أنعم
          ),
          child: Text(
            date,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11, // ⭐ تصغير الخط
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(width: 6),

        Container(
          width: 26, // أصغر
          height: 26,
          decoration: BoxDecoration(
            color: const Color(0x66FFFFFF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.calendar_month,
            color: Colors.white,
            size: 14, // أصغر
          ),
        ),
      ],
    ),
  ],
)

          ),
        ],
      ),
    );
  }
}