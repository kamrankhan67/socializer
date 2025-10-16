import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socializer/features/profile/domain/repositories/profile_repo.dart';
import 'package:socializer/features/profile/presentation/cubits/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> fetchUserProfile(String uid) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserData(uid);
      
      if (user != null) {
        
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError("User not Found"));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({required String uid, String? bio}) async {
    emit(ProfileLoading());
    try {
      final currentUser = await profileRepo.fetchUserData(uid);
      if (currentUser == null) {
        emit(ProfileError("Failed to update the profile"));
        return;
      }
      final updateProfile = currentUser.copyWith(
        newBio: bio ?? currentUser.bio,
      );

      await profileRepo.updateProfile(updateProfile);
    } catch (e) {
      emit(ProfileError("Error updating Profile : $e"));
    }
  }
}
