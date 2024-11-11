import 'package:flutter/material.dart';
import 'package:stem/widgets/appbar_row_widget.dart';
import 'package:stem/widgets/card_coloured_widget.dart';
import 'package:stem/widgets/custom_card_with_shadow.dart';
import 'package:stem/src/constants.dart' as globals;

class LevelUpScreen extends StatefulWidget {
  const LevelUpScreen({super.key});

  @override
  State<LevelUpScreen> createState() => _LevelUpScreenState();
}

class _LevelUpScreenState extends State<LevelUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFebdaff),
                  Color(0xFFf7f0ff),
                  Color(0xFFFDFCFD)
                ]),
          ),
          child: Column(
            children: [
              Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: globals.darkLavanda,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: AppBarRow(
                          title: 'Level Up With AI Coacher',
                        ),
                      )
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [    
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Resume and Cover Letter Builder:',
                      style: globals.h1DarkVioletText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CardColouredWidget(
                          link: '/cv_generator',
                          title: 'CV Generator',
                          text: 'Generate effective Resume',
                          btnTitle: 'Generate CV',
                        ),
                        SizedBox(width: 10),
                        CardColouredWidget(
                          link: 'cl_generator',
                          title: 'CL Generator',
                          text: 'Generate effective Cover Letter',
                          bgColour: globals.lavandaCard,
                          btnBgColour: Color(0xFF8779d1),
                          btnTitle: 'Generate CL',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'AI-Powered Mentorship:',
                      style: globals.h1DarkVioletText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCardWithShadow(
                      width: MediaQuery.of(context).size.width,
                      widget: const Column(
                        children: [
                          Text(''),
                          Text(
                            'AI can provide tailored advice and guidance based on your specific needs and goals.',
                            style: TextStyle(
                                color: globals.textVioletLavanda,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Job Alert System:',
                      style: globals.h1DarkVioletText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CardColouredWidget(
                          link: 'cl_generator',
                          title: 'Mock interview',
                          text: 'Get mock interview practice with AI.',
                          bgColour: globals.lavandaCard,
                          btnBgColour: Color(0xFF8779d1),
                          btnTitle: 'Start',
                        ),
                         SizedBox(width: 10),
                         CardColouredWidget(
                          link: '/cv_generator',
                          title: 'Job Search',
                          text: 'Offer job search tips',
                          btnTitle: 'Check',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Interview Preparation:',
                      style: globals.h1DarkVioletText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCardWithShadow(
                      width: MediaQuery.of(context).size.width,
                      widget: const Column(
                        children: [
                          Text(''),
                          Text(
                            'The AI can conduct mock interviews and provide tips for success.',
                            style: TextStyle(
                                color: globals.textVioletLavanda,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Career Roadmap Builder:',
                      style: globals.h1DarkVioletText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCardWithShadow(
                      width: MediaQuery.of(context).size.width,
                      widget: const Column(
                        children: [
                          Text(''),
                          Text(
                            'Ai Can Create customized career roadmaps with clear milestones and action steps.',
                            style: TextStyle(
                                color: globals.textVioletLavanda,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Career Pathing:',
                      style: globals.h1DarkVioletText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCardWithShadow(
                      width: MediaQuery.of(context).size.width,
                      widget: const Column(
                        children: [
                          Text(''),
                          Text(
                            'The AI can analyze your skills and interests to suggest potential career paths.',
                            style: TextStyle(
                                color: globals.textVioletLavanda,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


