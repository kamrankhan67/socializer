import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socializer/features/profile/domain/entities/profile_user.dart';
import 'package:socializer/features/profile/domain/repositories/profile_repo.dart';

class FirebaseProfileRepo implements ProfileRepo {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<ProfileUser?> fetchUserData(String uid) async {
    try {
      final userDoc = await firebaseFirestore
          .collection('users')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          return ProfileUser(
            email: userData['email'],
            name: userData['name'],
            uid: userData['uid'],
            imagePath: userData['imagePath'].toString(),
            bio: userData['bio']??'',
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedProfile) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(updatedProfile.uid)
          .update({
            'bio': updatedProfile.bio,
            'imagePath': updatedProfile.imagePath,
          });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
