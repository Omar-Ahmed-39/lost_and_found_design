import 'package:flutter/material.dart';
import 'package:lostandfound/core/theme/app_theme.dart';

class MyDropdownList<T> extends StatelessWidget {
  final T? selectedCategory;
  final String text;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const MyDropdownList({
    super.key,
    required this.selectedCategory,
    required this.text,
    required this.hint,
    required this.items,
    this.onChanged,
    this.validator,
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
          child: DropdownButtonFormField<T>(
            value: selectedCategory,
            isExpanded: true,
            validator: validator,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: AppTheme.primarybutton,
                  width: 2,
                ),
              ),

              hintText: hint,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.2,
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
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