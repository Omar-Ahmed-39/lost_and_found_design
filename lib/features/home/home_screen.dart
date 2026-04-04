import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/notification/notification.dart';
import 'package:lostandfound/features/profile/profile.dart';
import 'package:lostandfound/features/search/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    const Homepage(),
    const SearchPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: MyAppbar(),
      bottomNavigationBar: MyNavigationBottomBar(
        currentIndex: currentIndex,
        onItemSelected: changeIndex,
      ),
      body: pages[currentIndex],
    );
  }
}