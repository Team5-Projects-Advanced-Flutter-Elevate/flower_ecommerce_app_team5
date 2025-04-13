import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/view_model/profile_state.dart';
import 'package:flutter/material.dart';

class ProfileViewModelCubit extends Cubit<ProfileState> {
  ProfileViewModelCubit() : super(ProfileInitial());

  void processIntent(ProfileonIntent intent) {
    switch (intent) {
      case LoadProfile():
        _handleProfiledata();
        break;

    }
  }


  void _handleProfiledata(){

  }






}

sealed class ProfileonIntent {}

class LoadProfile extends ProfileonIntent {}
