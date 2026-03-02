import 'package:flutter/material.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      bottomNavigationBar: MyNavigationBottomBar(currentIndex: currentIndex),
      body: Text("Profile"),
    );
  }
}