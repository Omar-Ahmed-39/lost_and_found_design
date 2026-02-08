import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
 int currentIndex=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      bottomNavigationBar: MyNavigationBottomBar(currentIndex: currentIndex),
      body: Text("Search"),
    );
  }
}