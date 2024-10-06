import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  void login(BuildContext context, String email, String password) async {
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

    } catch (e) {
      Navigator.pop(context);

    }
  }

  void register(BuildContext context, String email, String password,
      String confirmPassword) async {

    if (password == confirmPassword) {
      try {

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
        Navigator.pop(context);
        Navigator.pop(context);

      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

      } catch (e) {
        Navigator.pop(context);

      }
    }
  }


  void logout(){
    FirebaseAuth.instance.signOut();
  }

}
