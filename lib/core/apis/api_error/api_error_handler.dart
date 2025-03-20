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
          return LocaleKeys.sendTimeout;
        case DioExceptionType.receiveTimeout:
          return LocaleKeys.receiveTimeout;
        case DioExceptionType.badResponse:
          return ApiErrorModel.fromJson(error.response?.data).message ??
              LocaleKeys.somethingWentWrong;
        case DioExceptionType.cancel:
          return LocaleKeys.cancel;
        case DioExceptionType.connectionError:
          return LocaleKeys.connectionError;
        case DioExceptionType.unknown:
          return LocaleKeys.unknown;
        case DioExceptionType.badCertificate:
          return LocaleKeys.badCertificate;
        default:
          return LocaleKeys.somethingWentWrong;
      }
    } else {
      return error.toString();
    }
  }
}
