import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  LocalNotificationsService(this._flutterLocalNotificationsPlugin);
  final AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel("channel_id", "Channel Name",
          importance: Importance.max, showBadge: true);

  Future<void> init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("drawable/ic_launcher_foreground");

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        debugPrint(
            "Foreground Notification Has been Tapped {${notificationResponse.payload}}");
        var notificationDetails = notificationResponse.payload?.split('\n');
        if (notificationDetails != null) {
          globalKeyNavigator.currentState?.pushNamed(
              DefinedRoutes.onNotificationOpenedApp,
              arguments: RemoteNotification(
                  title: notificationDetails[0], body: notificationDetails[1]));
        }
      },
    );

    // create Android Notification Channel
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  Future<void> showNotification(
      {String? title, String? body, String? payload}) async {
    int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    debugPrint("Showing notification with id: $notificationId");
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            androidNotificationChannel.id, androidNotificationChannel.name,
            channelDescription: androidNotificationChannel.description,
            importance: Importance.max,
            priority: Priority.high,
            icon: "drawable/ic_launcher_foreground",
            color: AppColors.mainColor);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(
        notificationId, title, body, notificationDetails,
        payload: "$title\n$body");
  }
}
