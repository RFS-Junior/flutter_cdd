import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.titleButton, required this.onPressedArgument});

  final VoidCallback onPressedArgument;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressedArgument(),
      child: Text(titleButton),
    );
  }
}
