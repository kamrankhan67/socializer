import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socializer/features/auth/presentation/components/my_button.dart';
import 'package:socializer/features/auth/presentation/components/my_textfield.dart';
import 'package:socializer/features/auth/presentation/cubits/auth_cubit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confermPasswordController = TextEditingController();

  void signUp() {
    String email = emailController.text;
    String pass = passwordController.text;
    String confermPw = confermPasswordController.text;
    String name = nameController.text;

    final authCubit = context.read<AuthCubit>();
    if (confermPw.isNotEmpty &&
        email.isNotEmpty &&
        pass.isNotEmpty &&
        name.isNotEmpty) {
      if (pass == confermPw) {
        authCubit.signUp(email, pass, name);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(" Password Do not Match")));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all the fields ")));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confermPasswordController.dispose();
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
              controller: nameController,
              hint: "Name",
              obscure: false,
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 10),
            MyTextfield(
              controller: confermPasswordController,
              hint: "Conferm Password",
              obscure: true,
            ),
            SizedBox(height: 20),
            MyButton(text: "Register",onTap: signUp,),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?  ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Log In", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
