import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler( RemoteMessage message) async {
  await Firebase.initializeApp();

  print('=== BACKGROUND MESSAGE ===');
  print('Title: ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Data : ${message.data}');
}

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  StreamSubscription<RemoteMessage>? _foregroundSubscription;
  StreamSubscription<RemoteMessage>? _tapSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;

  /// ============================
  /// INITIALIZATION
  /// ============================

  Future<void> initialize() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler,
    );

    await requestPermission();

    await setupTokenRefreshListener();

    await _handleInitialMessage();

    _listenForegroundMessages();

    _listenNotificationTap();
  }

  /// ============================
  /// PERMISSION
  /// ============================

  Future<NotificationSettings> requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      criticalAlert: false,
      carPlay: false,
    );

    print(
      'Notification Permission: ${settings.authorizationStatus}',
    );

    return settings;
  }

  /// ============================
  /// TOKEN
  /// ============================

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  Future<void> deleteToken() async {
    await _messaging.deleteToken();
  }

  Future<void> refreshToken() async {
    await _messaging.deleteToken();

    final newToken = await _messaging.getToken();

    print('New Token: $newToken');
  }

  Future<void> setupTokenRefreshListener({
    Future<void> Function(String token)? onRefresh,
  }) async {
    _tokenRefreshSubscription?.cancel();

    _tokenRefreshSubscription =
        FirebaseMessaging.instance.onTokenRefresh.listen(
      (token) async {
        print('FCM Token Refreshed: $token');

        if (onRefresh != null) {
          await onRefresh(token);
        }
      },
    );
  }

  /// ============================
  /// TOPICS
  /// ============================

  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  /// ============================
  /// FOREGROUND
  /// ============================

  void _listenForegroundMessages() {
    _foregroundSubscription?.cancel();

    _foregroundSubscription =
        FirebaseMessaging.onMessage.listen((message) {
      print('=== FOREGROUND MESSAGE ===');

      print('Title: ${message.notification?.title}');
      print('Body : ${message.notification?.body}');
      print('Data : ${message.data}');
    });
  }

  /// إذا أردت التعامل مع الرسالة بنفسك
  Stream<RemoteMessage> get onForegroundMessage =>
      FirebaseMessaging.onMessage;

  /// ============================
  /// NOTIFICATION TAP
  /// ============================

  void _listenNotificationTap() {
    _tapSubscription?.cancel();

    _tapSubscription =
        FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('=== NOTIFICATION TAPPED ===');

      print(message.data);
    });
  }

  /// إذا أردت الاستماع بنفسك
  Stream<RemoteMessage> get onNotificationTap =>
      FirebaseMessaging.onMessageOpenedApp;

  /// ============================
  /// APP CLOSED
  /// ============================

  Future<RemoteMessage?> getInitialMessage() async {
    return await _messaging.getInitialMessage();
  }

  Future<void> _handleInitialMessage() async {
    final message = await getInitialMessage();

    if (message != null) {
      print('=== APP OPENED FROM TERMINATED ===');

      print(message.data);
    }
  }

  /// ============================
  /// UTILITIES
  /// ============================

  Future<bool> isPermissionGranted() async {
    final settings = await _messaging.getNotificationSettings();

    return settings.authorizationStatus ==
        AuthorizationStatus.authorized;
  }

  Future<NotificationSettings> getNotificationSettings() async {
    return await _messaging.getNotificationSettings();
  }

  Future<void> setForegroundPresentationOptions() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// ============================
  /// BACKEND
  /// ============================

  Future<void> syncTokenWithBackend(
    Future<void> Function(String token) uploader,
  ) async {
    final token = await getToken();

    if (token != null) {
      await uploader(token);
    }
  }

  /// ============================
  /// DISPOSE
  /// ============================

  Future<void> dispose() async {
    await _foregroundSubscription?.cancel();
    await _tapSubscription?.cancel();
    await _tokenRefreshSubscription?.cancel();
  }
}