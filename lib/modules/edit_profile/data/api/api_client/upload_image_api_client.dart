import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/data/models/edite_profile/upload_image_response.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UploadImageApiClient {
  final Dio dio;
  UploadImageApiClient(this.dio);
  Future<UploadImageResponse> uploadProfileImageWithDio(File imageFile) async {
    // final formData = FormData.fromMap({
    //   'photo': await MultipartFile.fromFile(
    //     imageFile.path,
    //     filename: 'user_${DateTime.now().millisecondsSinceEpoch}.jpg',
    //     contentType: MediaType('image', 'jpeg'),
    //   ),
    // });
    var formData = FormData.fromMap({
      'photo': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
        contentType:
            MediaType('image', 'jpeg'), // Adjust the content type as needed
      )
    });

    var response = await dio.put(
      ApisEndpoints.uploadProfileImage,
      data: formData,
    );

    return UploadImageResponse.fromJson(response.data);
  }
}
