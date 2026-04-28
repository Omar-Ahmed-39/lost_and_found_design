import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/notification/notification.dart';
import 'package:lostandfound/features/profile/profile.dart';
import 'package:lostandfound/features/search/search.dart';

class NavigationController extends GetxController {
  int currentIndex = 0;

  final List<Widget> pages = [
    const Homepage(),
    const SearchPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update(); 
  }
}