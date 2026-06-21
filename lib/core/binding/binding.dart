import 'package:get/get.dart';
import 'package:lostandfound/core/local/local_controller.dart';
import 'package:lostandfound/core/theme/controller/theme_controller.dart';
import 'package:lostandfound/features/notification/controller/notification_controller.dart';

class Mybinding implements Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => MyLocalController());
    Get.lazyPut(() => ThemeController());
    Get.put(NotificationController(), permanent: true,);

  }
  
}