
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/features/profile/controller/profile_controller.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({super.key});

  final ProfileController controller =
      Get.find<ProfileController>();

  final TextEditingController nameController =
      TextEditingController(
    text: CacheHelper.getData(key: "name") ?? "",
  );

  final TextEditingController emailController =
      TextEditingController(
    text: CacheHelper.getData(key: "email") ?? "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: MyAppbarWithoutdetails(
        "edit profile".tr,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<ProfileController>(
            builder: (controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius:
                      BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration:
                                BoxDecoration(
                              shape:
                                  BoxShape.circle,
                              border: Border.all(
                                color:
                                    Colors.white,
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors
                                      .black
                                      .withOpacity(
                                          0.08),
                                  blurRadius: 14,
                                  offset:
                                      const Offset(
                                    0,
                                    6,
                                  ),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child:
                                  _buildProfileImage(),
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: InkWell(
                              onTap: () {
                                controller.pickImage()
                                    ;
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets
                                        .all(8),
                                decoration:
                                    BoxDecoration(
                                  color:
                                      Colors.blue,
                                  shape: BoxShape
                                      .circle,
                                  border:
                                      Border.all(
                                    color: Colors
                                        .white,
                                    width: 2,
                                  ),
                                ),
                                child:
                                    const Icon(
                                  Icons.camera_alt,
                                  color:
                                      Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 20),

                      Text(
                        "edit profile".tr,
                        style:
                            const TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height: 8),

                    
                      const SizedBox(
                          height: 30),

                      TextFormField(
                        controller:
                            nameController,
                        decoration:
                            InputDecoration(
                          labelText: "name".tr,
                          prefixIcon:
                              const Icon(
                            Icons.person,
                          ),
                          border:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        14),
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 16),

                      TextFormField(
                        controller:
                            emailController,
                        decoration:
                            InputDecoration(
                          labelText:
                              "email".tr,
                          prefixIcon:
                              const Icon(
                            Icons.email,
                          ),
                          border:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        14),
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 28),

                      SizedBox(
                        width:
                            double.infinity,
                        child: Mybutton(
                          text:
                              "save changes"
                                  .tr,
                          onTap: () {
                            controller
                                .updateProfile(
                              name:
                                  nameController
                                      .text,
                              email:
                                  emailController
                                      .text,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    

    if (controller.file == null) {
      return Container(
        color: Colors.grey.shade200,
        child: const Icon(
          Icons.person,
          size: 60,
          color: Colors.grey,
        ),
      );
    }

    return Image.file(
       controller.file! ,
      fit: BoxFit.cover,
      errorBuilder:
          (context, error, stackTrace) {
        return Container(
          color: Colors.grey.shade200,
          child: const Icon(
            Icons.person,
            size: 60,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}

