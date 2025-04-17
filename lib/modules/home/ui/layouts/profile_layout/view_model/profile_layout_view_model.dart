import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/login/view/login_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../../authentication/domain/use_cases/login/login_use_case.dart';

@injectable
class ProfileViewModelCubit extends Cubit<ProfileState> {
  ProfileViewModelCubit(this.loginUseCase) : super(ProfileInitial());
  LoginUseCase loginUseCase;
  void processIntent(ProfileOnIntent intent) {
    switch (intent) {
      case LoadProfile():
        _getProfileData();
        break;
    }
  }

  Future<void> clearSecureStorage(BuildContext context) async {
    // Todo: use logout api
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
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


}

sealed class ProfileOnIntent {}

class LoadProfile extends ProfileOnIntent {}
