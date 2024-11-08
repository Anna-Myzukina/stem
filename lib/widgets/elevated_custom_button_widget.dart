import 'package:flutter/material.dart';

/// Widget button will be used on sign up/login
/// First screens

class ElevatedCustomButtonWidget extends StatelessWidget {
  /// String title to display text on button
  final String? title;

  /// Function called when an item was tapped
  final void Function()? onTap;

  const ElevatedCustomButtonWidget({
    super.key,
    this.title,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
