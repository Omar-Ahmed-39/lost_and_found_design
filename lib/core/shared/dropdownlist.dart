import 'package:flutter/material.dart';

class MyDropdownList extends StatelessWidget {
  final String? selectedCategory;
  final String text;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;
  // 1. إضافة متغير الـ validator
  final String? Function(String?)? validator;

  const MyDropdownList({
    super.key,
    required this.selectedCategory,
    required this.text,
    required this.hint,
    required this.items,
    this.onChanged,
    this.validator, // 2. إضافته في الـ constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<String>(
            // ملاحظة: يفضل استخدام value بدلاً من initialValue عند التعامل مع FormField
            value: selectedCategory, 
            isExpanded: true,
            validator: validator, // 3. ربط الـ validator هنا
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              // تأكد من إضافة حدود الخطأ لتظهر بشكل جميل
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}