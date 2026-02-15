import 'package:flutter/material.dart';
import 'package:lostandfound/core/theme/app_theme.dart';

class MyReportCard extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final void Function() ontap;



  const MyReportCard({
    super.key, required this.color, required this.text, required this.icon, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:BorderRadius.circular(18) ,
      splashColor: Colors.black.withOpacity(0.3),
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: MyAppColor.card,
          boxShadow:  [  BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 6),
            color: Color(0x14000000),
          ),],
          borderRadius: BorderRadius.circular(18),
        ),
       width: double.infinity,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Container(
            decoration: BoxDecoration(
               color: color.withOpacity(0.4),
               borderRadius:   BorderRadius.circular(7),
               boxShadow: const [
       
        ],
            ),
            padding: EdgeInsets.all(5),
           
            child: Icon(icon ,color:color,),),
          Text(text)
          ],),),
    );
  }
}