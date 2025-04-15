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

class ProfileLoading extends ProfileState {}
