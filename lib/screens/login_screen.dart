import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/screens/register_screen.dart';
import 'package:my_chat_app/services/auth/auth_service.dart';
import 'package:my_chat_app/widgets/my_textField.dart';

import '../widgets/my_button.dart';
import '../widgets/square_image.dart';

class LoginScreen extends StatelessWidget {
  final emailController =TextEditingController();
  final passwordController =TextEditingController();

  void login(BuildContext context)async{
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator(color: Colors.teal,));
    });
   final authService =AuthService();
   authService.login(context, emailController.text, passwordController.text);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                  child: Text('Forget Password?',style: TextStyle(color: Colors.grey.shade500),),
                ),
        
              ],
            ),
            MyButton(
              text: 'login',
              onTap: ()=>login(context),
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
            const SizedBox(height: 40,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?'),
                SizedBox(width: 4,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) =>  RegisterScreen(),
                    ),);
                  },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold
                      ),))
              ],
            )
          ],
        ),
      )),
    );
  }
}
