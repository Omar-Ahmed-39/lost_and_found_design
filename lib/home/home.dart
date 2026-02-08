import 'package:flutter/material.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/home/details.dart';
import 'package:lostandfound/home/widget/card.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  int currentIndex = 3;
  final List<Map<String, dynamic>> items = [
       {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "موجود",
        "statusColor": Colors.green.withOpacity(0.8),
        "image": "assets/Images/bag.jpg",
      },
       {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "مفقود",
        "statusColor": Colors.red.withOpacity(0.8),
        "image": "assets/Images/bag.jpg",
      },
       {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "مفقود",
        "statusColor": Colors.red,
        "image": "assets/Images/bag.jpg",
      },
       {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "موجود",
        "statusColor": Colors.green,
        "image": "assets/Images/bag.jpg",
      },
       {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "مفقود",
        "statusColor": Colors.red,
        "image": "assets/Images/bag.jpg",
      },
       {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "مفقود",
        "statusColor": Colors.red,
        "image": "assets/Images/bag.jpg",
      },
      {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "مفقود",
        "statusColor": Colors.red,
        "image": "assets/Images/bag.jpg",
      },
      {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "مفقود",
        "statusColor": Colors.red,
        "image": "assets/Images/bag.jpg",
      },
      {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "موجود",
        "statusColor": Colors.green,
        "image": "assets/Images/bag.jpg",
      },
      {
        "title": "اسم العرض",
        "date": "12/8/2026",
        "status": "مفقود",
        "statusColor": Colors.red,
        "image": "assets/Images/bag.jpg",
      },
    ];

  Widget build(BuildContext context) {
    return Scaffold(
    extendBodyBehindAppBar: true,
    extendBody: true,
appBar: MyAppbar(),
 bottomNavigationBar: MyNavigationBottomBar( currentIndex: currentIndex),
  
      body: Container(child: 
      Column(children: [
       
         Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 20),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 في الصف
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.92, // قريب من شكل الكرت بالصورة
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>DetailsPage(title:  item["title"], date: item["date"],
                             status: item["status"], statusColor: item["statusColor"], image: item["image"]) ));
                      },
                      child: OfferCard(
                        title: item["title"],
                        date: item["date"],
                        status: item["status"],
                        statusColor: item["statusColor"],
                        imagePath: item["image"],
                      ),
                    );
                  },
                ),
              ),
            ),
          
      
        const SizedBox(width: 6),],)
        ),
      );
    
  }
}




