import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stem/screens/hexagon/hexagon_clip.dart';
import 'package:stem/screens/login/center_widget.dart';
import 'package:stem/widgets/elevated_custom_button_widget.dart';

import 'package:stem/src/constants.dart' as globals;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _textAnimation;
  late final Animation<Offset> _imageAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textAnimation = Tween<Offset>(
      begin: const Offset(-1, 0), // Slide from left
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _imageAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Slide from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0, // Fade in from transparent
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          ContentFirstScreenWidget(
            textAnimation: _textAnimation,
            imageAnimation: _imageAnimation,
            fadeAnimation: _fadeAnimation,
          ),
        ],
      ),
    );
  }
}

class ContentFirstScreenWidget extends StatelessWidget {
  final Animation<Offset> textAnimation;
  final Animation<Offset> imageAnimation;
  final Animation<double> fadeAnimation;

  const ContentFirstScreenWidget({
    super.key,
    required this.textAnimation,
    required this.imageAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideTransition(
          position: textAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Space',
                  style: GoogleFonts.lora(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: globals.lavandaCard
                    )
                  ),
                  Text(
                    'For women\nIn STEM',
                    style: GoogleFonts.lora(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: globals.textVioletLavanda
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
        SlideTransition(
          position: imageAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      ClipHexagon(
                        sides: 6,
                        boxShadows: [
                          HexagonBoxShadow(color: const Color.fromARGB(65, 76, 175, 79), elevation: 2)
                        ],
                        child: Container(
                          color: const Color.fromARGB(68, 76, 175, 79),
                          child: const Image(
                            //height: 60,
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/s.png')),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      ClipHexagon(
                        sides: 6,
                        boxShadows: [
                          HexagonBoxShadow(color: Colors.green, elevation: 2)
                        ],
                        child: Container(
                          color: const Color.fromARGB(90, 33, 149, 243),
                          child: const Image(
                            //height: 60,
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/t.png')),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      ClipHexagon(
                        sides: 6,
                        boxShadows: [
                          HexagonBoxShadow(color: globals.textVioletLavanda, elevation: 2)
                        ],
                        child: Container(
                          color: const Color.fromARGB(107, 181, 126, 220),
                          child: const Image(
                            //height: 60,
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/e.png')),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      ClipHexagon(
                        sides: 6,
                        boxShadows: [
                          HexagonBoxShadow(color: globals.textVioletLavanda, elevation: 2)
                        ],
                        child: Container(
                          color: const Color.fromARGB(63, 244, 67, 54),
                          child: const Image(
                            //height: 60,
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/m.png')),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
            //Image.asset(
              //'assets/images/stem.png',
              //height: MediaQuery.of(context).size.height * 0.25,
            //),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'Empowering Women and Girls in Science, Technology, Engineering, and Mathematics',
            textAlign: TextAlign.center,
            style: GoogleFonts.lora(
              fontSize: 18,
              color: globals.textVioletLavanda,
              fontWeight: FontWeight.bold
            )
            // TextStyle(
            //   fontSize: 18,
            //   color: globals.textVioletLavanda,
            // ),
          ),
        ),
        FadeTransition(
          opacity: fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedCustomButtonWidget(
                title: 'Register',
                onTap: () {
                  Get.toNamed('/login');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}