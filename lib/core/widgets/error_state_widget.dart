import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_handler.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_statless_widget.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends BaseStatelessWidget {
  final Object error;

   ErrorStateWidget({super.key, required this.error});

  @override
  Widget customBuild(BuildContext context) {
    final ApiErrorHandler apiErrorHandler = ApiErrorHandler.getInstance();
    return Center(
      child: Text(
        apiErrorHandler.handle(error),
        textAlign: TextAlign.center,
        style: theme.textTheme.labelMedium,
      ),
    );
  }
}
