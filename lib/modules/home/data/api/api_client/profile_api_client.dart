import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_profile/edite_profile_input_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_profile/edite_profile_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/edite_profile/upload_image_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/change_password/change_password_response.dart';

part 'profile_api_client.g.dart';

@RestApi(baseUrl: ApisEndpoints.baseUrl)
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @PUT(ApisEndpoints.uploadProfileImage)
  Future<UploadImageResponse> uploadProfileImage({
    @Part() required File imageFile,
  } // Add this
      );
  @PUT(ApisEndpoints.editProfile)
  Future<EditProfileResponse> editeProfile(
      @Body() EditProfileInputModel editProfileInputModel);
  @PATCH(ApisEndpoints.changePassword)
  Future<ChangePasswordResponse> changePassword(
      {@Query("password") required String? password,
      @Query("newPassword") required String? newPassword});
}
/*
{
    "password":"Ahmed@123",
    "newPassword":"Ahmed@1234"
}
* */
