import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';

   MyAppbar(){

 return PreferredSize(
  preferredSize: const Size.fromHeight(110),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(22),
        bottomRight: Radius.circular(22),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.18),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(22),
        bottomRight: Radius.circular(22),
      ),
      child: AppBar(
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 110,
        title:Image.asset(
            MyAppImage.logoImage,
            width: 140,
          ),
    
        actions: [
          Padding(
            padding: const EdgeInsets.only( right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      "hi".tr,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                     'علي بن سميدع', // غيّر الاسم هنا
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                ClipOval(
                  child: Image.asset(
                    MyAppImage.profileImage, 
                    width: 38,
                    height: 38,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],

        flexibleSpace: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MyAppImage.appbarBackImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  ),
);}



  MyAppbarWithoutdetails(String title){

 return PreferredSize(
  preferredSize: const Size.fromHeight(110),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(22),
        bottomRight: Radius.circular(22),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.18),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(22),
        bottomRight: Radius.circular(22),
      ),
      child: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 110,
        
        title:Text(title)
    
        ,

        flexibleSpace: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MyAppImage.appbarBackImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  ),
);}