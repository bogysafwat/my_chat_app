import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool obscureText;

  const MyTextfield({super.key, required this.controller, required this.text, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          fillColor: Colors.grey.shade200,
          filled: true
        ),

      ),
    );
  }
}
