import 'package:flutter/material.dart';
import 'package:socializer/features/auth/presentation/components/my_button.dart';
import 'package:socializer/features/auth/presentation/components/my_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
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
            SizedBox(height: 10,),
            MyTextfield(
              controller: passwordController,
              hint: "Password",
              obscure: true,
            ),
            SizedBox(height: 20,),
            MyButton(text: "Login",),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account?  ",style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                GestureDetector(child: Text( "Log In",style: TextStyle(color: Colors.black)))
              ],
            )
           
          ],
        ),
      ),
    );
  }
}