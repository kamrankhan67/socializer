import 'package:firebase_auth/firebase_auth.dart';
import 'package:socializer/features/auth/domain/entities/app_user.dart';
import 'package:socializer/features/auth/domain/repositories/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<AppUser?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        email: userCredential.user!.email!,
        uid: userCredential.user!.uid,
        name: '',
      );
      return user;
    } catch (e) {
      throw Exception("Login Failed !!$e");
    }
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        email: email,
        uid: userCredential.user!.uid,
        name: name,
      );
      return user;
    } catch (e) {
      throw Exception("Registration Failed !!$e");
    }
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = await firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return null;    }
    return AppUser(email: firebaseUser.email!, name: '', uid: firebaseUser.uid);
  }
}
