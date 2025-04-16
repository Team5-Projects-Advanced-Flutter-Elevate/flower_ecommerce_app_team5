import 'package:equatable/equatable.dart';

sealed class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSuccess extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileDataSuccess extends ProfileState {
  final String name;
  final String lastName;
  final String email;
  final String id;
  final String photo;
  final String phone;
  final String gender;
  ProfileDataSuccess(this.name, this.email, this.id, this.photo, this.phone,
      this.gender, this.lastName);

  @override
  List<Object?> get props => [name, email, id, photo, phone, gender];
}

class ProfileError extends ProfileState {
  final Object error;
  ProfileError(this.error);

  @override
  List<Object?> get props => [];
}

class ProfileEnableChangePasswordButton extends ProfileState {
  @override
  List<Object?> get props => [];
}
