import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/services/get_it_services.dart';
import 'package:lostandfound/features/home/model/details_model.dart';
import 'package:lostandfound/features/notification/model/match_model.dart';

class NotificationController extends GetxController {
  bool hasUnreadNotifications = false;
  final ApiConsumer api = getIt<ApiConsumer>();
   String? fcmToken;

 
  List<Map<String, dynamic>> notifications = [];
  Future<MatchData?> getMatchById(int matchId) async {
  try {
    final response = await api.get(
      EndPoint.getMatchById(matchId),
    );

    MatchResponse matchResponse =
        MatchResponse.fromJson(response);

    return matchResponse.data;
  } on ServerException catch (e) {
    Get.snackbar(
      e.erorrModel.title,
      e.erorrModel.erorrmessage,
    );

    return null;
  }
}

Future<ReportDetailsData?> getReportById(
  int reportId,
) async {
  try {
    final response = await api.get(
      EndPoint.getReportById(reportId),
    );

    final report =
        ReportDetailsResponse.fromJson(response);

    return report.data;
  } on ServerException catch (e) {
    Get.snackbar(
      e.erorrModel.title,
      e.erorrModel.erorrmessage,
    );

    return null;
  }
}
Future<Map<String, dynamic>?> getMatchReports(
  int matchId,
) async {
  final match = await getMatchById(matchId);

  if (match == null) return null;

  final lostReport =
      await getReportById(match.lostId);

  final foundReport =
      await getReportById(match.foundId);
 
  print("========== LOST ==========");
  print(lostReport?.itemName);

  print("========== FOUND ==========");
  print(foundReport?.itemName);
  return {
    "lost": lostReport,
    "found": foundReport,
  };
}

  void loadNotifications() {
    notifications = CacheHelper.getListMap(
      key: "notifications",
    );

    update();
  }

  void markNotificationsAsRead() {
    hasUnreadNotifications = false;
    update();
  }

  Future<void> clearNotifications() async {
    notifications.clear();

    await CacheHelper.removeData(
      key: "notifications",
    );

    hasUnreadNotifications = false;

    update();
  }

  void saveNotification({
    required String title,
    required String body,
    String? matchId,
  }) {
    final exists = notifications.any(
  (e) => e["matchId"] == matchId,
);

if (exists) {
  return;
}
    print("SAVE NOTIFICATION");
print("matchId = $matchId");
    notifications.insert(0, {
      "title": title,
      "body": body,
      "matchId": matchId,
    });

    hasUnreadNotifications = true;

    CacheHelper.saveListMap(
      key: "notifications",
      value: notifications,
    );

    update();
  }

  @override
  void onInit() {
    super.onInit();

    loadNotifications();

    myPermissionMessage();
    getinitialMessage();
    ifAppIsOpen();
    ifClickOnNotfication();
  }

  myPermissionMessage() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings =
        await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<String?>? getToken() async {
    String? mytoken =
        await FirebaseMessaging.instance.getToken();
       return mytoken;
  }

  getinitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance
            .getInitialMessage();

    if (initialMessage != null) {
      print(initialMessage.data);

      if (initialMessage.notification != null) {
        saveNotification(
          title:
              initialMessage.notification!.title ??
                  "No Title",
          body:
              initialMessage.notification!.body ?? "",
          matchId:
              initialMessage.data["matchId"],
        );
      }

      if (initialMessage.data['type'] ==
          'Homepage') {
        // Navigation Here
      }
    }
  }

  ifAppIsOpen() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print(message.data);

        if (message.notification != null) {
          saveNotification(
            title:
                message.notification!.title ??
                    "No Title",
            body:
                message.notification!.body ?? "",
            matchId:
                message.data["matchId"],
          );
        }
      },
    );
  }

  ifClickOnNotfication() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        print(
            "================================");
        print("excuetonMessageOpenedApp");

        print(message.data);

        if (message.notification != null) {
          saveNotification(
            title:
                message.notification!.title ??
                    "No Title",
            body:
                message.notification!.body ?? "",
            matchId:
                message.data["matchId"],
          );
        }
      },
    );
  }
}