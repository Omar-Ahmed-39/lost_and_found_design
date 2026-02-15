import 'package:flutter/material.dart';

class MyDropdownList extends StatelessWidget {
  final String? selectedCategory;
  final String text;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;

  MyDropdownList({
    super.key,
    required this.selectedCategory,
    required this.text,
    required this.hint,
    required this.items, this.onChanged,
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
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<String>(
            initialValue: selectedCategory,
            isExpanded: true,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: Icon(Icons.keyboard_arrow_down),
            items: items,
            onChanged:onChanged
          ),
        ),
      ],
    );
  }
}
