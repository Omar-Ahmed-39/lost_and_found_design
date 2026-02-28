import 'dart:io';

import 'package:dio/dio.dart';
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