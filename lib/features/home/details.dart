import 'package:flutter/material.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/home/claim.dart';
import 'package:lostandfound/features/home/done.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;
  final String image;

  const DetailsPage({super.key, required this.title, required this.date, required this.status, required this.statusColor, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWithoutdetails(title),
      //  bottomNavigationBar: MyNavigationBottomBar( currentIndex: 3),
       body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
         child: ListView(children: [
          const SizedBox(height: 10,),
          ClipRRect(
            borderRadius:BorderRadius.all(Radius.circular(19)) ,
            child: Stack(children: [Container(width: double.infinity,
             child: Image.network(image,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) =>
                   Image.asset(MyAppImage.imagebroken,fit: BoxFit.cover) ,)),
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
             ])),
           
           SizedBox(height: 10,),
           ClipRRect(
               borderRadius:BorderRadius.all(Radius.circular(19)) ,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(children: [
              Text("تفاصيل الغرض",style: MyTextStyle.meduimtitle(),),
             Align(
              alignment: Alignment.centerRight,
               child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [
                 Text("الحالة: $status",style: MyTextStyle.subtitel(),),
                 Text("التاريخ: $date",style: MyTextStyle.subtitel(),),
                 Text("العنوان: $status",style: MyTextStyle.subtitel(),),
                 

               ],),
             ),
   
         
            ],),)),
              SizedBox(height: 20,),
             Mybutton(text:"مطالبة",onTap: () {
                // Navigator.of(context).pushAndRemoveUntil(
                //           MaterialPageRoute(
                //             builder: (context) =>DonePage() ),(route) => false,);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ClaimPage() ,));
                      
             },),
         SizedBox(height: 50,)
         ],),
       )

    );
  }
}