import 'package:socializer/features/profile/domain/entities/profile_user.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUser profileUser;
  ProfileLoaded(this.profileUser);
}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
