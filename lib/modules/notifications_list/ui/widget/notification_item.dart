import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationItem extends BaseStatelessWidget {
  final String title;
  final String body;
  const NotificationItem({super.key, required this.title, required this.body});

  @override
  Widget customBuild(BuildContext context, inherit) {
    return Column(
      children: [
        SizedBox(
          height: inherit.screenHeight * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.notifications_none_outlined,
                size: 20,
              ),
              SizedBox(
                width: inherit.screenWidth * 0.015,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: inherit.theme.textTheme.labelLarge,
                    ),
                    Text(
                      body,
                      style: inherit.theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.normal, color: AppColors.gray),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider()
      ],
    );
  }
}
