import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> MyImagePicker() async {
   File file;
    final ImagePicker picker = ImagePicker();
    final XFile? imagecamera = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85,);  
    if(imagecamera!=null){
    file=File(imagecamera.path);
    return file;
                
    }   
    return null ;  
  }

  
  
Future uploadImageToAPI(File image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}


Future<List<File>> MyMultiImagePicker() async {
  final ImagePicker picker = ImagePicker();

  final List<XFile> images = await picker.pickMultiImage(
    imageQuality: 85,
  );

  if (images.length > 5) {
    Get.snackbar(
      "تنبيه",
      "يمكنك اختيار 5 صور كحد أقصى",
    );

    return images
        .sublist(0, 5)
        .map((e) => File(e.path))
        .toList();
  }

  return images
      .map((e) => File(e.path))
      .toList();
}