import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../di/injectable_initializer.dart';

@injectable
class ApiManager {
  late Dio dio;

  static final ApiManager _instance = ApiManager._();

  factory ApiManager() {
    return _instance;
  }

  ApiManager._() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
  }

  Future<Response> put(
      {required String endPoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) {
    return dio.put(
      endPoint,
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        validateStatus: (status) => true,
      ),
    );
  }
}

extension ApiManagerExtension on ApiManager {
  static void updateDioServiceWithToken(String token) {
    Dio dio = getIt.get<Dio>();
    BaseOptions newBaseOptions =
        BaseOptions(connectTimeout: const Duration(seconds: 30), headers: {
      "Authorization": "Bearer $token",
    });
    dio.options = newBaseOptions;
  }
}
