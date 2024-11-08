import 'package:flutter/material.dart';
import 'package:stem/src/constants.dart' as globals;

class StemCountRowWidget extends StatelessWidget {
  final String? stemTitle;
  final String? stemTipe;
  final Color stemColor;

  const StemCountRowWidget({
    super.key,
    this.stemTitle,
    this.stemTipe,
    this.stemColor = globals.deepPink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: stemColor, 
              shape: BoxShape.circle),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            stemTipe ?? '',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          stemTitle ?? '',
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}