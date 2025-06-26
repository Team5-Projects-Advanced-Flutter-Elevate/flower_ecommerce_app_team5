import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/main.dart';
import 'package:flower_ecommerce_app_team5/modules/firebase_cloud_messaging/data/apis/local_notifications_api.dart';
import 'package:flutter/material.dart';
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
        (newFcmToken) {
          debugPrint("======> Refreshed Token:$newFcmToken");
        },
      ).onError((error) {
        debugPrint("Error Refreshing Token: $error");
      });
      // init setup for handling push notifications
      initPushNotifications();
    } else {
      debugPrint(
          "Notification Authorization Status: ${notificationSettings.authorizationStatus}");
    }
  }

// received messages handling function
  Future<void> handleMessage(RemoteMessage? message) async {
    debugPrint("current state ${globalKeyNavigator.currentState}========>");
    if (message == null) return;
    // Navigate to a new screen
    globalKeyNavigator.currentState?.pushNamed(
        DefinedRoutes.onNotificationOpenedApp,
        arguments: message.notification);
  }

// setup foreground and background settings
  Future<void> initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    await _firebaseMessaging.getInitialMessage().then(handleMessage);

    // attach event listener for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // notification when the app is in background
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

    // notification when the app is in foreground
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
  }

  /// Handles messages received while the app is in the foreground
  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('Foreground message received: ${message.data}');
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

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  debugPrint("Background Handler");
  // Handle the message
}
