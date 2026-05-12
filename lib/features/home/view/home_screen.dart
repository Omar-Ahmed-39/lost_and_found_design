import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/features/home/controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          
          extendBody: true,
          appBar: MyAppbar(),
          bottomNavigationBar: const MyNavigationBottomBar(), 
          body: controller.pages[controller.currentIndex],
        );
      },
    );
  }
}