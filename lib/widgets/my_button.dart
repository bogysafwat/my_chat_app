import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
