import 'package:socializer/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  ProfileUser({
    required super.email,
    required super.name,
    required super.uid,
    required this.imagePath,
    required this.bio,
  });
  final String bio;
  final String imagePath;

  ProfileUser copyWith({String? newBio, String? newImagePath}) {
    return ProfileUser(
      email: email,
      name: name,
      uid: uid,
      imagePath: newImagePath ?? imagePath,
      bio: newBio ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'bio': bio,
      'imagePath': imagePath,
    };
  }

  factory ProfileUser.fromJson(Map<String, dynamic> appUser) {
    return ProfileUser(
      email: appUser['email'],
      name: appUser['name'],
      uid: appUser['uid'],
      imagePath: appUser['imagePath'] ?? '',
      bio: appUser['bio'] ?? '',
    );
  }
}
