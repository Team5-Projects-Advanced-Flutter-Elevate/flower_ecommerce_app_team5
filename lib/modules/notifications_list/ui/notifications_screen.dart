import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/loading_state_widget.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/ui/view_model/notification_state.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/ui/view_model/notification_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/ui/widget/notification_item.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState
    extends BaseStatefulWidgetState<NotificationsScreen> {
  NotificationViewModel notificationViewModel =
      getIt.get<NotificationViewModel>();

  @override
  void initState() {
    super.initState();
    notificationViewModel.getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => notificationViewModel,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            LocaleKeys.notification.tr(),
            style: theme.textTheme.labelMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        body: BlocBuilder<NotificationViewModel, NotificationState>(
          builder: (context, state) {
            switch (state.notificationStatus) {
              case Status.idle:
                return const SizedBox();
              case Status.loading:
                return const LoadingWidget();
              case Status.success:
                List<NotificationEntity> notifications =
                    state.notifications ?? [];
                if (notifications.isEmpty) {
                  return Center(
                    child: Text(
                      LocaleKeys.noNotificationFound.tr(),
                      style: theme.textTheme.labelMedium,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationItem(
                        title: notifications[index].title ?? "",
                        body: notifications[index].body ?? " ");
                  },
                );
              case Status.error:
                return ErrorStateWidget(error: state.error!);
            }
          },
        ),
      ),
    );
  }
}
