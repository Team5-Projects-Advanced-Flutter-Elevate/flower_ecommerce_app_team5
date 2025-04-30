import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/notification_item.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class OnNotificationOpenedApp extends BaseStatelessWidget {
  final RemoteNotification notification;
  const OnNotificationOpenedApp({super.key, required this.notification});

  @override
  Widget customBuild(BuildContext context, inherit) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          LocaleKeys.notification.tr(),
          style: inherit.theme.textTheme.labelMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          NotificationItem(
              title: notification.title ?? "", body: notification.body ?? "")
        ],
      ),
    );
  }
}
