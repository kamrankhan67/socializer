import 'package:socializer/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  // all possible operations perform on auth

  Future<AppUser?> loginWithEmailAndPassword(String email, String password);
  Future<AppUser?> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<void> logOut();
  Future<AppUser?> getCurrentUser();
}
