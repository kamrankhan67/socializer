import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socializer/features/auth/presentation/pages/login_page.dart';
import 'package:socializer/features/auth/presentation/pages/signup_page.dart';
import 'package:socializer/features/theme/light_theme.dart';
import 'package:socializer/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
