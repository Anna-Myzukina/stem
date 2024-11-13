import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stem/widgets/appbar_row_widget.dart';
import 'package:stem/widgets/calming_widget.dart';
import 'package:stem/widgets/custom_card_full_width.dart';
import 'package:stem/widgets/dashboard_cards/influentsl_women_widget.dart';
import 'package:stem/widgets/dashboard_cards/mathematical_facts_widget.dart';
import 'package:stem/widgets/dashboard_cards/realworld_projects_widget.dart';
import 'package:stem/widgets/google_map_events_widget.dart';
import '../widgets/dashboard_cards/crowdsourcing_platforms_widget.dart';

import 'package:stem/src/constants.dart' as globals;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: const Column(
            children: [
              AppBarRow(),
              SizedBox(height: 40),
              // Padding(
              //     padding: const EdgeInsets.all(18.0),
              //     child: Container(
              //       width: MediaQuery.of(context).size.width,
              //       height: 60,
              //       decoration: BoxDecoration(
              //         color: const Color.fromARGB(171, 72, 171, 161),
              //         border: Border.all(
              //           color: globals.greenLavanda,
              //           width: 1,
              //         ),
              //         borderRadius: const BorderRadius.all(Radius.circular(22)),
              //       ),
              //       child: Center(
              //         child: Text('Your STEM space',
              //         style: GoogleFonts.lora(
              //           color: globals.lightLavanda,
              //           fontWeight: FontWeight.w600,
              //           fontSize: 20
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              //   const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Row(
              //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Icon(Icons.question_answer,
              //       color: globals.textVioletLavanda,
              //       size: 26,),
              //       SizedBox(width: 5.0),
              //       Text(
              //         'Quiz',
              //         style: globals.h1DarkVioletText,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 20),
              // CustomCardWithShadow(
              //   aroundPadding: 15.0,
              //   width: MediaQuery.of(context).size.width,
              //   widget: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Expanded(
              //             flex: 1,
              //             child: Container(
              //               width: 110,
              //               height: 110,
              //               decoration: const BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage('assets/images/math.png'),
              //                       fit: BoxFit.cover),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(22)),
              //                   color: globals.lavanda),
              //             ),
              //           ),
              //           const Expanded(
              //               flex: 2,
              //               child: Column(
              //                 children: [
              //                   Text(
              //                     'Find Your STEM Fit',
              //                     style: globals.h1DarkVioletText,
              //                   ),
              //                   Padding(
              //                     padding: EdgeInsets.only(
              //                       left: 15.0, 
              //                       top: 10.0, 
              //                       bottom: 10.0
              //                       ),
              //                     child: Text(
              //                       'Take quiz to discover study areas and careers that match your interests.',
              //                       style: TextStyle(
              //                           color: globals.textVioletLavanda),
              //                     ),
              //                   )
              //                 ],
              //               ))
              //         ],
              //       ),
              //       const SizedBox(height: 20,),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               Get.toNamed('/quiz');
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 color: globals.lightLavanda,
              //                 borderRadius: BorderRadius.circular(20.0),
              //                 boxShadow: const [
              //               BoxShadow(
              //                 color: Colors.white, 
              //                 offset: Offset(-3, -3), 
              //                 blurRadius: 1
              //                 ),
              //               BoxShadow(
              //                   color: Color.fromRGBO(214, 223, 230, 1),
              //                   offset: Offset(5, 5),
              //                   blurRadius: 1)
              //                       ]
              //                     ),
              //               child: const Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              //                 child: Text('Take quiz',
              //                 style: TextStyle(
              //                   color: globals.textVioletLavanda,
              //                   fontSize: 18
              //                 ),
              //                 ),
              //               )),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(height: 40),
              Row(
                children: [
                  SizedBox(width: 8),
                  Icon(
                    Icons.list,
                    color: globals.textVioletLavanda,
                    size: 26,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Common free STEM courses:',
                    style: globals.h1DarkVioletText,
                  )
                ],
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCardModuleFullWidth(
                      link: '/computer_science',
                      image: 'assets/images/cs.png',
                      title: 'Computer Science',
                      list1: 'Harvard University',
                      list2: 'University of Michigan',
                      list3: 'freeCodeCamp',
                      list4: 'The Odin Project',
                      cardType: CustomCardGradientType.purple,
                    ),
                    SizedBox(width: 15),
                    CustomCardModuleFullWidth(
                      link: '/mathematic',
                      image: 'assets/images/math.png',
                      title: 'Mathematics',
                      list1: 'MIT OpenCourseWare',
                      list2: 'University of Sydney',
                      list3: 'Khan Academy',
                      list4: 'Coursera',
                      cardType: CustomCardGradientType.blue,
                    ),
                    SizedBox(width: 15),
                    CustomCardModuleFullWidth(
                      link: '/physic',
                      image: 'assets/images/physics.png',
                      title: 'Physics',
                      list1: 'MIT OpenCourseWare',
                      list2: 'Khan Academy',
                      list3: 'Coursera',
                      list4: 'University of Virginia',
                      cardType: CustomCardGradientType.green,
                    ),
                    SizedBox(width: 15),
                    CustomCardModuleFullWidth(
                      link: '/engineering',
                      image: 'assets/images/engineering.png',
                      title: 'Engineering',
                      list1: 'Brown University',
                      list2: 'Delft University',
                      list3: 'Khan Academy',
                      list4: 'edX',
                      cardType: CustomCardGradientType.red,
                    ),
                    SizedBox(width: 15),
                    CustomCardModuleFullWidth(
                      link: '/biology',
                      image: 'assets/images/biology.png',
                      title: 'Biology',
                      list1: 'MIT OpenCourseWare',
                      list2: 'Duke University',
                      list3: 'Khan Academy',
                      list4: 'Coursera',
                      cardType: CustomCardGradientType.orange,
                    ),
                    SizedBox(width: 15),
                    CustomCardModuleFullWidth(
                      link: '/chemistry',
                      image: 'assets/images/chemistry.png',
                      title: 'Chemistry',
                      list1: 'Khan Academy',
                      list2: 'MIT OpenCourseWare',
                      list3: 'edX',
                      list4: 'Coursera',
                      cardType: CustomCardGradientType.lightBlue,
                    ),
                    SizedBox(width: 15),
                    CustomCardModuleFullWidth(
                      link: '/astronomy',
                      image: 'assets/images/astronomy.png',
                      title: 'Astronomy',
                      list1: 'edX',
                      list2: 'Coursera',
                      list3: 'MIT OpenCourseWare',
                      list4: 'University of Arizona',
                      cardType: CustomCardGradientType.brown,
                    ),
                    SizedBox(width: 15),
                    CustomCardModuleFullWidth(
                      link: '/environmental_science',
                      image: 'assets/images/environmental.png',
                      title: 'Environmental Science',
                      list1: 'Yale University',
                      list2: 'University of Illinois',
                      list3: 'Coursera',
                      list4: 'MIT OpenCourseWare',
                      cardType: CustomCardGradientType.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.ellipsis, size: 30, color: Colors.grey),
                ],
              ),
              
              SizedBox(height: 20),
              InfluentalWomenWidget(),
              SizedBox(height: 20),
              RealworldProjectsWidget(),
              SizedBox(height: 20),
              CrowdsourcingPlatformCardWidget(),
              SizedBox(height: 20),
              MathematicalFactsWidget(),
              SizedBox(height: 20),
              CalmingWidget(),
              SizedBox(height: 20),
              GoogleMapEventsWidget(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

