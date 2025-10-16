import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socializer/features/auth/presentation/components/my_button.dart';
import 'package:socializer/features/auth/presentation/components/my_textfield.dart';
import 'package:socializer/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void onLogin() {
    String email = emailController.text;
    String password = passwordController.text;
    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && password.isNotEmpty) {
      authCubit.login(email, password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please Enter Email and Password Both")),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: 30),
            Icon(
              Icons.lock_open_sharp,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome Back, you've been missed!",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 20),
            MyTextfield(
              controller: emailController,
              hint: "Email",
              obscure: false,
            ),
            SizedBox(height: 10),
            MyTextfield(
              controller: passwordController,
              hint: "Password",
              obscure: true,
            ),
            SizedBox(height: 20),
            MyButton(text: "Login", onTap: onLogin),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an Account?  ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
