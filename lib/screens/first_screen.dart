import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/screens/login/center_widget.dart';
import 'package:stem/widgets/elevated_custom_button_widget.dart';
import 'package:stem/src/constants.dart' as globals;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

   
  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(113, 156, 139, 255),
              globals.lavandaCard,
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
          colors: [
            globals.darkLavanda,
            Color.fromARGB(27, 181, 126, 220),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child: topWidget(screenSize.width),
          ),
          Positioned(
            bottom: -180,
            left: -40,
            child: bottomWidget(screenSize.width),
          ),
          CenterWidget(size: screenSize),
          const ContentFirstScreenWidget(),
        ],
      ),
    );
  }
}


class ContentFirstScreenWidget extends StatelessWidget {
  const ContentFirstScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //  SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.1,
        // ),
        Positioned(
          top: 136,
          left: 24,
          child: Text(
          'Bridging\nSTEM Gap',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: globals.textVioletLavanda),
          ),
        ),
        
        Padding(
          padding: EdgeInsets.only(top: 170.0),
          child: Column(
            children: [
              // Text(
              //   'Empowering Women and Girls in Science, Technology, Engineering, and Mathematics',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: globals.textVioletLavanda,
              //   )
              // ),
              Image.asset('assets/images/stem.png',
                height: MediaQuery.of(context).size.height * 0.45),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Empowering Women and Girls in Science, Technology, Engineering, and Mathematics',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: globals.textVioletLavanda,
                        )
                      ),
                      // Text(
                      // 'Our Mission: Equip girls and women with the skills and confidence to excel in STEM fields.',
                      // style: TextStyle(
                      //   fontSize: 18,
                      //   color: globals.textVioletLavanda),
                      //   textAlign: TextAlign.center,
                      // ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedCustomButtonWidget(
                  title: 'Next',
                  onTap: () {
                    Get.toNamed('/home');
                  },
                ),
              ],
            )
            // NeuButton(
            //   buttonColor: globals.textVioletLavanda,
            //   onTap: () {
            //     Get.toNamed('/home');
            //   },
            //   isIcon: false,
            //   text: const Text(
            //     'Next',
            //     style: TextStyle(
            //       color: globals.lavanda,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18.0
            //     ),),
            //   newWidth: 150,
            // ),
          ),
        ),
      ],
    );
  }
}
