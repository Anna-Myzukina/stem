import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stem/screens/login/change_animation.dart';
import 'package:stem/screens/login/helper_functions.dart';
import 'package:stem/src/constants.dart' as globals;

import 'login_content.dart';

class TopText extends StatefulWidget {
  const TopText({super.key});

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
  
  @override
  void initState() {
    ChangeScreenAnimation.topTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelperFunctions.wrapWithAnimatedBuilder(
      animation: ChangeScreenAnimation.topTextAnimation,
      child: Text(
        ChangeScreenAnimation.currentScreen == Screens.createAccount
            ? 'Create\nAccount'
            : 'Welcome\nBack',
        style: GoogleFonts.lora(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: globals.textVioletLavanda
        )
        // TextStyle(
        //   fontSize: 40,
        //   fontFamily: 'Lora',
        //   fontWeight: FontWeight.w600,
        //   color: globals.textVioletLavanda
        // ),
      ),
    );
  }
}
