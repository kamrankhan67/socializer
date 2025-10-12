// weather the user is loged in or signup

import 'package:flutter/material.dart';
import 'package:socializer/features/auth/presentation/pages/login_page.dart';
import 'package:socializer/features/auth/presentation/pages/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggle() {
   setState(() {
      showLoginPage = !showLoginPage;
   });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: toggle,);
    } else {
      return SignupPage(onTap: toggle,);
    }
  }
}
