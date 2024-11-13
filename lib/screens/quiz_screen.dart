import 'dart:convert';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:flutter/services.dart' show rootBundle;
import 'package:stem/widgets/appbar_row_widget.dart';
import 'package:stem/widgets/neubutton_widget.dart';

class StemQuizScreen extends StatefulWidget {
  const StemQuizScreen({super.key});

  @override
  State<StemQuizScreen> createState() => _StemQuizScreenState();
}

class _StemQuizScreenState extends State<StemQuizScreen> {
  bool isHover = false;
  List<dynamic> _quizData = [];
  final List<String> _selectedInterests = [];
  int _currentQuestionIndex = 0;
  bool _showResultButton = false;
  late double _progressValue;
  String? generatedText;
  late final GenerativeModel model;

  @override
  void initState() {
    super.initState();
    _loadQuizData();
    model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');
    _progressValue = 0.0;
  }

  Future<void> _loadQuizData() async {
    final String response = await rootBundle.loadString('assets/data/quiz.json');
    final data = await json.decode(response);
    setState(() {
      _quizData = data['questions'];
    });
  }

  String _generatePrompt() {
    String prompt = "You are a career consultant. Based on these interests: ${_selectedInterests.join(', ')}, ";
    prompt += "what STEM fields would be a good fit for me? Name one of: Science, Mathematics, Engineering, Technology. Answer in a short, supportive manner with an explanation why.";
    return prompt;
  }

  Future<void> generateText() async {
    final promptContent = [Content.text(_generatePrompt())];
    try {
      final response = await model.generateContent(promptContent);
      setState(() {
        generatedText = response.text;
      });
    } catch (e) {
      print('Error generating text: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_quizData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final currentQuestion = _quizData[_currentQuestionIndex];
    final options = currentQuestion['options'];

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const AppBarRow(
              title: 'Explore you in STEM',
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text('Your progress',
                      style: TextStyle(
                        color: globals.textVioletLavanda,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora',
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                          begin: 0.0,
                          end: (_currentQuestionIndex + 1) / _quizData.length),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) =>
                          LinearProgressIndicator(
                        backgroundColor: globals.darkLavanda,
                        color: globals.textVioletLavanda,
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(20),
                        value: _progressValue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // CustomCardWithShadow(
            //   aroundPadding: 10.0,
            //   width: MediaQuery.of(context).size.width,
            //   widget: const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16.0),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           flex: 3,
            //           child: Text(
            //             'Try',
                        //'Answer these 21 quick questions to discover subjects that might be a good fit for you.',
            //             textAlign: TextAlign.left,
            //             style: TextStyle(
            //               color: globals.greyLavanda,
            //               fontSize: 16,
            //               fontFamily: 'Lora',
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         SizedBox(width: 10),
            //         Expanded(
            //           flex: 1,
            //           child: Image(image: AssetImage('assets/images/math.png')),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                currentQuestion['text'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: globals.textVioletLavanda,
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  for (var option in options)
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.0,
                              child: AnimatedContainer(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.bounceIn,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/quiz/${option['image']}'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: isHover
                                            ? const Color.fromARGB(83, 40, 10, 75)
                                            : const Color(0xFFf4ecff),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: globals.lavanda)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedInterests.add(option['text']);
                                            _progressValue += 0.1;
                                            if (_currentQuestionIndex <
                                                _quizData.length - 1) {
                                              _currentQuestionIndex++;
                                            }
                                            if (_currentQuestionIndex ==
                                                _quizData.length - 1) {
                                              _showResultButton = true;
                                            }
                                          });
                                        },
                                        child: Center(
                                          child: Text(
                                            option['text'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: globals.textVioletLavanda,
                                                fontSize: 18,
                                                fontFamily: 'Lora'),
                                          ),
                                        ),
                                        onHover: (value) {
                                          setState(() {
                                            isHover = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            NeuButton(
              buttonColor: globals.textVioletLavanda,
              onTap: () async {
                if (_showResultButton) {
                  await generateText();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('STEM Recommendation'),
                        content: Text(generatedText ?? 'Error generating recommendation.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/home');
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(fontSize: 18, fontFamily: 'Lora'),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Get.toNamed('/home');
                }
              },
              isIcon: false,
              text: Text(
                _showResultButton ? 'Show Result' : 'Back',
                style: const TextStyle(
                  color: globals.lavanda,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              newWidth: 150,
            ),
            const SizedBox(width: 50.0),
          ],
        ),
      ),
    );
  }
}