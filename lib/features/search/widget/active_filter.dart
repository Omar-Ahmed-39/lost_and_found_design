import 'package:flutter/material.dart';
import 'package:lostandfound/core/theme/app_theme.dart';

class SearchActiveFilters extends StatelessWidget {
  final List<String> filters;
  final void Function(String filter) onRemove;

  const SearchActiveFilters({
    super.key,
    required this.filters,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];

          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => onRemove(filter),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: MyAppColor.primarybutton,
                    width: 1.8,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.close,
                      size: 18,
                      color: MyAppColor.primarybutton,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      filter,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: MyAppColor.primarybutton,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}