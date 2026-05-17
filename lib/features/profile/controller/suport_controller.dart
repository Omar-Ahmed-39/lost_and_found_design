import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/services/get_it_services.dart';

class SupportController extends GetxController {
  ApiConsumer api = getIt<ApiConsumer>();

  late TextEditingController subjectController;
  late TextEditingController messageController;

  final formKey = GlobalKey<FormState>();

  int rating = 0;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    subjectController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void onClose() {
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }

  void changeRating(int value) {
    rating = value;
    update();
  }

  Future<void> sendSupportRequest() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (rating == 0) {
      Get.snackbar(
        "error".tr,
        "please_select_rating".tr,
      );
      return;
    }

    try {
      isLoading = true;
      update();

      await api.post(
        EndPoint.support,
        data: {
          "subject": subjectController.text.trim(),
          "message": messageController.text.trim(),
          "rating": rating,
        },
      );

      Get.back();

      Get.snackbar(
        "success".tr,
        "support_request_sent_successfully".tr,
      );
    } on ServerException catch (e) {
      Get.snackbar(
        "error".tr,
        e.erorrModel.erorrmessage,
        animationDuration: const Duration(seconds: 3),
      );
    } finally {
      isLoading = false;
      update();
    }
  }
}