import 'package:socializer/features/profile/domain/entities/profile_user.dart';

abstract class ProfileRepo {
  Future<ProfileUser?> fetchUserData(String uid);
  Future<void> updateProfile(ProfileUser updatedProfile);
}
