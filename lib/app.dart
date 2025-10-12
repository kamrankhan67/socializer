import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socializer/features/auth/data/firebase_auth_repo.dart';
import 'package:socializer/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:socializer/features/auth/presentation/cubits/auth_states.dart';
import 'package:socializer/features/auth/presentation/pages/auth_page.dart';
import 'package:socializer/features/home/presentation/pages/home_page.dart';
import 'package:socializer/theme/light_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authRepo = FirebaseAuthRepo();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            print(authState);
            if (authState is UnAuthenticated) {
              return const AuthPage();
            }
            if (authState is Authenticated) {
              return HomePage();
            } else {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          },
          listener: (context, state) {
            if (state is AuthErrors) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }
}
