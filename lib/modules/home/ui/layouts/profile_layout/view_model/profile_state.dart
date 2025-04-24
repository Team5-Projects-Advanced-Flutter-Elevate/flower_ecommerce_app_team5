import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/terms.dart';

import '../../../../domain/entities/about_us.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileDataSuccess extends ProfileState {
  final String name;
  final String email;
  final String id;
  final String photo;
  ProfileDataSuccess(this.name, this.email, this.id, this.photo);
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}

class IsGuest extends ProfileState {
  final bool isGuest;
  IsGuest(this.isGuest);
}

class AboutUsSuccess extends ProfileState {
  final AboutUsEntity data;

  AboutUsSuccess(this.data);
}

class AboutUsError extends ProfileState {
  final String error;
  AboutUsError(this.error);
}

class AboutUsLoading extends ProfileState {}

class TermsSuccess extends ProfileState {
  final GetTermsEntity data;

  TermsSuccess(this.data);
}

class TermsError extends ProfileState {
  final String error;
  TermsError(this.error);
}

class TermsLoading extends ProfileState {}

class ProfileLoading extends ProfileState {}
