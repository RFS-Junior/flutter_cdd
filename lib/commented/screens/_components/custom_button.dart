import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {super.key, required this.labelButton, required this.onPressedArgument});

  final VoidCallback onPressedArgument;
  final Widget labelButton;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          onPressedArgument();
        },
        label: labelButton);
  }
}
