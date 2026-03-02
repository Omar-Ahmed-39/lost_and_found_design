import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lostandfound/core/theme/app_theme.dart';

class ImagePickerCard extends StatelessWidget {
  final String title;
  final File? file;
  final VoidCallback onTap;
  final double height;
  final double radius;

  const ImagePickerCard({
    super.key,
    this.title = "اضف صورة",
    required this.file,
    required this.onTap,
    this.height = 150,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            height: height,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: MyAppColor.card,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(width: 0.5, color: Colors.black),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: file != null
                  ? Image.file(
                      file!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined, size: 30),
                          Text('ارفع صورة'),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
