import 'package:flutter/material.dart';
import 'package:lostandfound/core/theme/app_theme.dart';

class MyTypeCard extends StatelessWidget {
  final Color color;
  final String text;
  final bool isselected;
  final IconData icon;
  final void Function() ontap;

  const MyTypeCard({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    required this.ontap,
    required this.isselected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      splashColor: Colors.black.withOpacity(0.3),
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color:Colors.grey[200],
         
          border: isselected
              ? Border.all(color: MyAppColor.primarybutton)
              : null,
          borderRadius: BorderRadius.circular(18),
        ),
        width: 100,
        height: 100,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.4),
                borderRadius: BorderRadius.circular(7),
                boxShadow: const [],
              ),
              padding: EdgeInsets.all(5),

              child: Icon(icon, color: color),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}