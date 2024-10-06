import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textField.dart';
import '../widgets/square_image.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final confirmPassword=TextEditingController();

  void register(BuildContext context) async{
    showDialog(context: context, builder: (context){
      return Center(child: Container(child: CircularProgressIndicator(color: Colors.teal,),));
    });

    final authService =AuthService();
    authService.register(context, emailController.text, passwordController.text, confirmPassword.text);
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(child:
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const Icon(Icons.lock,color: Colors.teal,size: 100,),
            const SizedBox(height: 50,),
            const Text('Welcome back you\'ve been missed',
              style: TextStyle(color: Colors.black,fontSize: 16)
              ,),
            const SizedBox(height: 50,),
            MyTextfield(
              text: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            MyTextfield(
              text: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            MyTextfield(
              text: 'Confirm Password',
              obscureText: true,
              controller: confirmPassword,
            ),

            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(height: 12,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareImage(imagePath: 'assets/images/google.png'),
                SizedBox(width: 24,),
                SquareImage(imagePath:'assets/images/apple.png' )
              ],
            ),
           
          ],
        ),
      )),
    );
  }
}

