import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/screens/chat_screen.dart';
import 'package:my_chat_app/screens/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
          builder:(context,snapshot) {
            if(snapshot.hasData){
              return ChatScreen();
            }else{
              return LoginScreen();
            }
          }),
    );
  }
}
