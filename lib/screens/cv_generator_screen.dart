import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stem/features/cv_generator/data.dart';
import 'package:stem/features/cv_generator/repo/resume_template.dart';
import 'package:stem/features/cv_generator/src/enums.dart';
import 'package:stem/features/cv_generator/src/theme.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/appbar_row_widget.dart';

class CvGeneratorScreen extends StatefulWidget {
  const CvGeneratorScreen({super.key});

  @override
  State<CvGeneratorScreen> createState() => _CvGeneratorScreenState();
}

class _CvGeneratorScreenState extends State<CvGeneratorScreen> 
  with TickerProviderStateMixin {

  late TemplateTheme theme = TemplateTheme.modern;
  List<TemplateTheme> list = [
    TemplateTheme.classic,
    TemplateTheme.modern,
    TemplateTheme.technical,
    TemplateTheme.business,
  ];

  void getCvTheme(BuildContext context, int index) {
    setState(() {
      theme = list[index];
    });
  }

  void getRandomItem(BuildContext context) {
    final random = Random();
    final index = random.nextInt(4);
    theme = list[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(132, 235, 218, 255),
      ),
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
              const AppBarRow(
                title: '4 CV Templates Available',
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  CvVersionsRowWidget(
                    onTapBusiness: () {
                      getCvTheme(context, 0);
                    },
                    onTapClassic: () {
                      getCvTheme(context, 1);
                    },
                    onTapModern: () {
                      getCvTheme(context, 2);
                    },
                    onTapTechnical: () {
                      getCvTheme(context, 3);
                    },
                  ),
                  FadeTransition(
                    opacity: AnimationController(
                        duration: const Duration(seconds: 2),
                        vsync: this,
                      )..forward(),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          getRandomItem(context);
                        });
                      },
                      child: Container(
                        height: 45,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: globals.blueGreyLavanda),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            'Random',
                            style: TextStyle(
                                color: globals.whiteLavanda,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ResumeTemplate(
                  data: data,
                  imageHeight: 100,
                  imageWidth: 100,
                  emailPlaceHolder: 'Email:',
                  telPlaceHolder: 'No:',
                  experiencePlaceHolder: 'Past',
                  educationPlaceHolder: 'School',
                  languagePlaceHolder: 'Skills',
                  aboutMePlaceholder: 'About Me',
                  hobbiesPlaceholder: 'Past Times',
                  mode: TemplateMode.onlyEditableMode,
                  showButtons: true,
                  imageBoxFit: BoxFit.fitHeight,
                  enableDivider: false,
                  backgroundColorLeftSection: globals.lavandaCard,
                  templateTheme: theme),
            ],
          ),
        ),
      ),
    );
  }
}

class CvVersionsRowWidget extends StatefulWidget {
  final void Function() onTapBusiness;
  final void Function() onTapClassic;
  final void Function() onTapModern;
  final void Function() onTapTechnical;

  const CvVersionsRowWidget(
      {super.key,
      required this.onTapBusiness,
      required this.onTapClassic,
      required this.onTapModern,
      required this.onTapTechnical});

  @override
  State<CvVersionsRowWidget> createState() => _CvVersionsRowWidgetState();
}

class _CvVersionsRowWidgetState extends State<CvVersionsRowWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _controller2 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _controller3 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();
    _controller4 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward(); // Start the fade-in on initState.
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        FadeTransition(
          opacity: _controller1,
          child: InkWell(
            onTap: widget.onTapBusiness,
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: globals.blueBrightLavanda),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Business',
                  style: TextStyle(
                      color: globals.whiteLavanda,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              )),
            ),
          ),
        ),
        const SizedBox(width: 5),
        FadeTransition(
          opacity: _controller2,
          child: InkWell(
            onTap: widget.onTapClassic,
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: globals.lavandaCard),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Classic',
                  style: TextStyle(
                      color: globals.whiteLavanda,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              )),
            ),
          ),
        ),
        const SizedBox(width: 5),
        FadeTransition(
          opacity: _controller3,
          child: InkWell(
            onTap: widget.onTapModern,
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: globals.blueDarkLavanda),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Modern',
                  style: TextStyle(
                      color: globals.whiteLavanda,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              )),
            ),
          ),
        ),
        const SizedBox(width: 5),
        FadeTransition(
          opacity: _controller4,
          child: InkWell(
            onTap: widget.onTapTechnical,
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: globals.blueLavanda),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Technical',
                  style: TextStyle(
                      color: globals.whiteLavanda,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              )),
            ),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
