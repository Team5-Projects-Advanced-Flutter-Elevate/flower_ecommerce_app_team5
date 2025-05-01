import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bases/base_stateful_widget_state.dart';
import '../../../core/di/injectable_initializer.dart';
import '../../../shared_layers/localization/generated/locale_keys.g.dart';
import 'cubit/states.dart';
import 'cubit/viewModel.dart';

class NotificationsPageScreen extends StatefulWidget {
  const NotificationsPageScreen({super.key});

  @override
  State<NotificationsPageScreen> createState() =>
      _NotificationsPageScreenState();
}

class _NotificationsPageScreenState
    extends BaseStatefulWidgetState<NotificationsPageScreen> {
  late NotificationsViewModelCubit viewModel =
      getIt.get<NotificationsViewModelCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.processIntent(LoadNotificationsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          leadingWidth: screenWidth * 0.08,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.notifications.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        body: BlocBuilder<NotificationsViewModelCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationSuccess) {
              return ListView.builder(
                itemCount: state.data.notifications.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.notifications_none),
                        title: Text(
                          state.data.notifications[index].title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                            state.data.notifications[index].body ?? '',
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.gray,
                      )
                    ],
                  );
                },
              );
            } else if (state is NotificationError) {
              return ErrorStateWidget(error: state.message);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
