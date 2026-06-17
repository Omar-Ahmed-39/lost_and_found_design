import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/features/profile/controller/profile_controller.dart';

   PreferredSize MyAppbar(){

 return PreferredSize(
  preferredSize: const Size.fromHeight(110),
  child: Container(width: double.infinity,
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
        title: Transform.translate(
  offset: const Offset(-27, 5),
  child: Image.asset(
    MyAppImage.logoImage,
    width: 250,
  ),
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
                      
                     '${CacheHelper.getData(key: "name")}', // غيّر الاسم هنا
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
            GetBuilder<ProfileController>(
              init:ProfileController() ,
              
              builder: (controller) {
            return  GestureDetector(
  onTap: () {
    controller.updateImageProfile();
   
  },
  child: Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: ClipOval(
      child: Builder(
        builder: (context) {
          final imageUrl =
              CacheHelper.getData(key: "avatarUrl");

          // لا يوجد صورة
          if (imageUrl == null ||
              imageUrl.toString().isEmpty) {
            return Container(
              color: Colors.grey.shade200,
              child: const Icon(
                Icons.person,
                size: 20,
                color: Colors.grey,
              ),
            );
          }

          // يوجد صورة
          return Image.network(
            "http://127.0.0.1:5000/$imageUrl",
            fit: BoxFit.cover,
            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return Container(
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.grey,
                ),
              );
            },
          );
        },
      ),
    ),
  ),
);
            },),
              ],
            ),
          ),
        ],

        flexibleSpace: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Get.isDarkMode?MyAppImage.appbardarkImage: MyAppImage.appbarBackImage),
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
              image: AssetImage(Get.isDarkMode?MyAppImage.appbardarkImage: MyAppImage.appbarBackImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  ),
);}