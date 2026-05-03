import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/theme/app_theme.dart';

class FilterButton extends StatelessWidget {
  final bool isClick;
  final VoidCallback onTap;

  const FilterButton({super.key, required this.isClick, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: !isClick
            ? Icon(Icons.filter_alt_outlined,color: MyAppColor.primarybutton, size: 40)
            : Icon(
                Icons.filter_alt_rounded,
                size: 40,
                color: MyAppColor.primarybutton,
              ),
      ),
    );
  }
}
