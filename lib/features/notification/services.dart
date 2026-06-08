// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/foundation.dart';

// // ---------------------------------------------------------------------------
// // دالة الاستماع للإشعارات في الخلفية (يجب أن تكون خارج الكلاس أو Top-Level)
// // ---------------------------------------------------------------------------
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   debugPrint("تم استلام رسالة في الخلفية: ${message.messageId}");
// }

// class FcmService {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

//   // ==========================================
//   // 1. دالة التهيئة الأساسية (تستدعى بعد أخذ نسخة من الكلاس)
//   // ==========================================
//   Future<void> init() async {
//     // 1. طلب الصلاحيات
//     await requestPermission();

//     // 2. تهيئة استقبال الرسائل والتطبيق مغلق أو في الخلفية
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//     // 3. إعداد الإشعارات المحلية
//     await _setupLocalNotifications();

//     // 4. الاستماع للرسائل والتطبيق مفتوح
//     _listenToForegroundMessages();

//     // 5. الاستماع لحدث الضغط على الإشعار
//     _setupInteractedMessage();
//   }

//   // ==========================================
//   // 2. إدارة الصلاحيات والتوكن (Token)
//   // ==========================================
  
//   Future<void> requestPermission() async {
//     NotificationSettings settings = await _fcm.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       provisional: false,
//     );
//     debugPrint('حالة الصلاحية: ${settings.authorizationStatus}');
//   }

//   Future<String?> getToken() async {
//     try {
//       String? token = await _fcm.getToken();
//       debugPrint("FCM Token: $token");
//       return token;
//     } catch (e) {
//       debugPrint("خطأ في جلب التوكن: $e");
//       return null;
//     }
//   }

//   Stream<String> get onTokenRefresh => _fcm.onTokenRefresh;

//   // ==========================================
//   // 3. إدارة المواضيع (Topics)
//   // ==========================================

//   Future<void> subscribeToTopic(String topic) async {
//     await _fcm.subscribeToTopic(topic);
//     debugPrint("تم الاشتراك في الموضوع: $topic");
//   }

//   Future<void> unsubscribeFromTopic(String topic) async {
//     await _fcm.unsubscribeFromTopic(topic);
//     debugPrint("تم إلغاء الاشتراك من الموضوع: $topic");
//   }

//   // ==========================================
//   // 4. دوال مساعدة داخلية (Private Methods)
//   // ==========================================

//   Future<void> _setupLocalNotifications() async {
//     const AndroidInitializationSettings androidInitSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings iosInitSettings = DarwinInitializationSettings();

//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidInitSettings,
//       iOS: iosInitSettings,
//     );

//     await _localNotifications.initialize(initSettings);

//     if (defaultTargetPlatform == TargetPlatform.android) {
//       const AndroidNotificationChannel channel = AndroidNotificationChannel(
//         'high_importance_channel',
//         'High Importance Notifications',
//         description: 'هذه القناة مخصصة للإشعارات المهمة.',
//         importance: Importance.max,
//       );

//       await _localNotifications
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//     }
//   }

//   void _listenToForegroundMessages() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;

//       if (notification != null && android != null) {
//         _localNotifications.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               'high_importance_channel',
//               'High Importance Notifications',
//               importance: Importance.max,
//               priority: Priority.high,
//               icon: '@mipmap/ic_launcher',
//             ),
//           ),
//         );
//       }
//     });
//   }

//   Future<void> _setupInteractedMessage() async {
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       _handleMessageOpen(initialMessage);
//     }

//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpen);
//   }

//   void _handleMessageOpen(RemoteMessage message) {
//     debugPrint("تم الضغط على الإشعار! البيانات: ${message.data}");
    
//     // التعامل مع التوجيه باستخدام GetX كمثال:
//     // if (message.data['route'] != null) {
//     //   Get.toNamed(message.data['route']);
//     // }
//   }
// }