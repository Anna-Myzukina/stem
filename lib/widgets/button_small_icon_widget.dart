import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stem/src/constants.dart' as globals;

class ButtonSmallIconWidget extends StatelessWidget {
  final void Function() onTap;

  final IconData? icon;

  final Color? buttonColor;

  final Color? iconColor;

  const ButtonSmallIconWidget({
    required this.onTap,
    this.icon,
    this.buttonColor,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: globals.lightPinkCard,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 16),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: buttonColor ?? const Color.fromARGB(132, 247, 240, 255),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
              child: Icon(
            icon ?? FontAwesomeIcons.chevronLeft,
            color: iconColor ?? globals.greyBorder,
          )),
        ),
      ),
    );
  }
}
