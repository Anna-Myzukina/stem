import 'package:flutter/material.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/neubutton_widget.dart';

class CustomAppBar extends StatelessWidget {
  final IconData? firstIcon;
  final void Function() onFirstTap;
  final void Function() onSecondTap;
  final IconData? secondIcon;
  final String title;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.firstIcon,
      this.secondIcon,
      required this.onFirstTap,
      required this.onSecondTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeuButton(
          icon: firstIcon,
          onTap: onFirstTap,
          iconColor: globals.darkBlueGreyColor,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: globals.h1DarkVioletText.copyWith(fontSize: 22,),
          ),
        ),
        NeuButton(
          icon: secondIcon,
          onTap: onSecondTap,
          iconColor: globals.darkBlueGreyColor,
        ),
      ],
    );
  }
}