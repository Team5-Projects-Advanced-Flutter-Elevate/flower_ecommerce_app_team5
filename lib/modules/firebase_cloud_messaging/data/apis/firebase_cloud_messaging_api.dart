import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/local_notifications/local_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseCloudMessagingAPi {
  late final LocalNotificationsService _localNotificationsService;
  FirebaseCloudMessagingAPi(this._localNotificationsService);

  // creating an instance from firebase messaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // notifications initialization function
  Future<void> initNotifications() async {
    // request permission from user
    final NotificationSettings notificationSettings =
        await _firebaseMessaging.requestPermission();
    debugPrint(
        "Notification Authorization Status: ${notificationSettings.authorizationStatus}");
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      // get token for this device
      final fcmToken = await _firebaseMessaging.getToken();
      debugPrint("======> Token:$fcmToken");
      _firebaseMessaging.onTokenRefresh.listen(
        (event) {
          debugPrint("======> Refreshed Token:$fcmToken");
        },
      ).onError((error) {
        debugPrint("Error Refreshing Token: $error");
      });
    } else {
      debugPrint(
          "Notification Authorization Status: ${notificationSettings.authorizationStatus}");
    }

    // init setup for handling push notifications
    initPushNotifications();
  }

// received messages handling function
  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;
    // Navigate to a new screen
    debugPrint("Inside Handle Message");
  }

// setup foreground and background settings
  Future<void> initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    await _firebaseMessaging.getInitialMessage().then(handleMessage);

    // attach event listener for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // notification when the app is in background
    FirebaseMessaging.onBackgroundMessage(
      (message) {
        return handleMessage(message);
      },
    );

    // notification when the app is in foreground
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
  }

  /// Handles messages received while the app is in the foreground
  void _onForegroundMessage(RemoteMessage message) {
    print('Foreground message received: ${message.data.toString()}');
    final notificationData = message.notification;
    if (notificationData != null) {
      // Display a local notification using the service
      _localNotificationsService.showNotification(
          title: notificationData.title,
          body: notificationData.body,
          payload: message.data.toString());
    }
  }
}
