import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socializer/features/auth/domain/entities/app_user.dart';
import 'package:socializer/features/auth/domain/repositories/auth_repo.dart';
import 'package:socializer/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  AppUser? _currentUser;
  final AuthRepo authRepo;

  // weather user is login or not

  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user: user));
    } else {
      emit(UnAuthenticated());
    }
  }

  // get current user

  AppUser? get currentUser => _currentUser!;

  // login with email and password

  Future<void> login(String email, String pw) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailAndPassword(email, pw);
      if (user != null) {
        _currentUser=user;
        emit(Authenticated(user: user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthErrors(message: e.toString()));
      emit(UnAuthenticated());
    }
  }

  // register with email and password

  Future<void> signUp(String email, String pw, String name) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailAndPassword(email, pw, name);
      if (user != null) {
         _currentUser=user;
        emit(Authenticated(user: user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthErrors(message: e.toString()));
      emit(UnAuthenticated());
    }
  }

  // logout

  void logout() {
    authRepo.logOut();
    emit(UnAuthenticated());
  }
}
