import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_error/api_error_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/generated/locale_keys.g.dart';

class ApiErrorHandler {
  static ApiErrorHandler? _instance;
  ApiErrorHandler._init();

  static ApiErrorHandler getInstance() {
    if (_instance == null) {
      _instance = ApiErrorHandler._init();
    } else {
      _instance;
    }
    return _instance!;
  }

  String handle(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return tr(LocaleKeys.connectionTimeout);
        case DioExceptionType.sendTimeout:
          return tr(LocaleKeys.sendTimeout);
        case DioExceptionType.receiveTimeout:
          return tr(LocaleKeys.receiveTimeout);
        case DioExceptionType.badResponse:
          return ApiErrorModel.fromJson(error.response?.data).message ??
              tr(LocaleKeys.somethingWentWrong);
        case DioExceptionType.cancel:
          return tr(LocaleKeys.cancel);
        case DioExceptionType.connectionError:
          return tr(LocaleKeys.connectionError);
        case DioExceptionType.unknown:
          return tr(LocaleKeys.unknown);
        case DioExceptionType.badCertificate:
          return tr(LocaleKeys.badCertificate);
        default:
          return tr(LocaleKeys.somethingWentWrong);
      }
    } else {
      return error.toString();
    }
  }
}
