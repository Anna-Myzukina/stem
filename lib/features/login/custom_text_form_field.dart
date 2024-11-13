import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String label;
  //final String? hint;
  final String? Function(String?)? validator;
  final int maxLines;
  final IconData? iconData;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.obscureText = false,
      //required this.hint,
      required this.label,
      this.validator,
      this.iconData,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black87,
      color: Colors.transparent,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            //hintText: hint,
            prefixIcon: Icon(iconData),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none
              )),
      ),
    );
  }
}
