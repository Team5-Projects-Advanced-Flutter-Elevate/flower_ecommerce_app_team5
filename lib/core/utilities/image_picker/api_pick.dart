import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart'; // for MediaType

class Api {
  static Future<Response> uploadProfileImageWithDio(
      File imageFile, String token) async {
    final dio = Dio();

    final String url =
        'https://flower.elevateegy.com/api/v1/auth/upload-photo'; // replace with actual URL

    final formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(
        imageFile.path,
        filename: 'user_${DateTime.now().millisecondsSinceEpoch}.jpg',
        contentType: MediaType('image', 'jpeg'),
      ),
    });

    final response = await dio.put(
      url,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer $token', // optional if auth needed
        },
      ),
    );

    return response;
  }
}
