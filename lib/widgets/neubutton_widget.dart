import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NeuButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? icon;
  final double newWidth;
  final double newHeight;
  final bool isIcon;
  final Text? text;
  final Color? iconColor;
  final Color? buttonColor;

  const NeuButton({
    this.icon,
    required this.onTap,
    this.newHeight = 50,
    this.newWidth = 50,
    this.isIcon = true,
    this.text,
    this.iconColor = Colors.black,
    this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: newWidth,
          height: newHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: buttonColor ?? const Color(0xffEEEEEE),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff9eadb6),
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2.0, -2.0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                ),
              ]),
          child: Center(
            child: isIcon
                ? FaIcon(
                    icon,
                    size: 20,
                    color: iconColor,
                  )
                : text,
          ),
        ));
  }
}
