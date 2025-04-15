import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/use_cases/login_as_guest/login_as_gust_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/login/view/login_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../shared_layers/localization/enums/languages_enum.dart';
import '../../../../../authentication/domain/use_cases/login/login_use_case.dart';

@injectable
class ProfileViewModelCubit extends Cubit<ProfileState> {
  ProfileViewModelCubit(this.loginUseCase) : super(ProfileInitial());
  LoginUseCase loginUseCase;
  void processIntent(ProfileonIntent intent) {
    switch (intent) {
      case LoadProfile():
        _getProfileData();
        break;
    }
  }

  Future<void> clearSecureStorage(BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  Future<void> _getProfileData() async {
    try {
      emit(ProfileLoading());
      var profileData = await loginUseCase.getStoredLoginInfo();
      var name = profileData?.user?.firstName ?? 'Guest';
      var email = profileData?.user?.email ?? 'Guest-User';
      var id = profileData?.user?.sId ?? 'Guest';
      var image = profileData?.user?.photo ?? 'Guest';
      emit(ProfileDataSuccess(name, email, id, image));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  // Future<void> _checkIfGuest() async {
  //   try {
  //     emit(ProfileLoading());
  //     var isGuest = await loginAsGuestUseCase.isGuest();
  //     var name = profileData?.user?.firstName;
  //     var email = profileData?.user?.email;
  //     var id = profileData?.user?.sId;
  //     var image=profileData?.user?.photo;
  //     print('userName$image');
  //     emit(ProfileDataSuccess(name!, email!, id!,image!));
  //   } catch (e) {
  //     emit(ProfileError(e.toString()));
  //   }
  // }
}

sealed class ProfileonIntent {}

class LoadProfile extends ProfileonIntent {}
