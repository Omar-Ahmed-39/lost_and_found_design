import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/search/widget/filter_button.dart';
import 'package:lostandfound/features/search/widget/search_filde.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int currentIndex = 2;
  bool isclick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      bottomNavigationBar: MyNavigationBottomBar(currentIndex: currentIndex),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FilterButton(
                    isClick: isclick,
                    onTap: () {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: const Text(
                "فلترة البحث",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.find_in_page_outlined),
              title: const Text("مفقودات"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: const Text("موجودات"),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
},
                  ),
                ),

                Expanded(child: MySearchFilde()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

