import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white54,
      elevation: 8,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
