import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:flutter/services.dart' show rootBundle;
import 'package:stem/widgets/custom_card_with_shadow.dart';
import 'package:stem/widgets/neubutton_widget.dart';

class StemQuizScreen extends StatefulWidget {
  const StemQuizScreen({super.key});

  @override
  State<StemQuizScreen> createState() => _StemQuizScreenState();
}

class _StemQuizScreenState extends State<StemQuizScreen> {
  bool isHover = false;
  List<dynamic> _quizData = [];
  List<String> _selectedInterests = [];
  int _currentQuestionIndex = 0;
  bool _showResultButton = false;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _loadQuizData();

    _progressValue = 0.0;
  }

  // Load quiz data from JSON file
  Future<void> _loadQuizData() async {
    final String response =
        await rootBundle.loadString('assets/data/quiz.json');
    final data = await json.decode(response);
    setState(() {
      _quizData = data['questions'];
    });
  }

  // Function to generate the prompt for Gemini AI
  String _generatePrompt() {
    String prompt =
        "You are a carrer consultant. Based on these interests: ${_selectedInterests.join(', ')}, ";
    prompt +=
        "what STEM fields would be a good fit for me, you should name one of: Science, Mathematic, Engineering, Technology? The answer shuold be short, few setnences, in supportive manner with explanation why";
    return prompt;
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
            Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/ai_bg.png')),
                    color: globals.darkLavanda,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 16.0),
                        child: Text(
                          'Explore you in STEM',
                          style: TextStyle(
                              color: globals.lightLavanda,
                              fontFamily: 'Lora',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image(
                          height: 150,
                          image: AssetImage('assets/images/ai_agent.png')),
                    )
                  ],
                )),
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
                          end:
                              (_currentQuestionIndex + 1) / _quizData.length),
                      duration: const Duration(
                          milliseconds: 500), // Adjust the duration as needed
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
            CustomCardWithShadow(
              aroundPadding: 10.0,
              width: MediaQuery.of(context).size.width,
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: const Text(
                        'Answer these 21 quick questions to discover subject that might be a good fit for you.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: globals.greyLavanda,
                          fontSize: 16,
                          fontFamily: 'Lora',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Image(
                        image: AssetImage('assets/images/math.png')),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // current question
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(currentQuestion['text'], 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: globals.textVioletLavanda,
                fontSize: 18,
                fontFamily: 'Lora',
                fontWeight: FontWeight.bold
              )),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              // this will come from quiz.json
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
                                duration: Duration(microseconds: 500),
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
                                            : Color(0xFFf4ecff),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                globals.lavanda)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedInterests.add(
                                              option['text'],
                                            );
                                            _progressValue += 0.1;
                                            // Only increment if it won't go out of bounds
                                            if (_currentQuestionIndex <
                                                _quizData.length - 1) {
                                              _currentQuestionIndex++;
                                            }
                        
                                            if (_currentQuestionIndex <=
                                                _quizData.length) {
                                              // Now check the condition
                                              String prompt =
                                                  _generatePrompt();
                                              print(
                                                  "My prompt is: $prompt");
                                            }
                        
                                            // Show the "Show Result" button after the last question
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
                                            style: TextStyle(
                                                color: globals.textVioletLavanda,
                                                fontSize: 18,
                                                fontFamily: 'Lora'
                                                ),
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
                  //const SizedBox(height: 20.0),
                ],
              ),
            ),
            //const SizedBox(height: 20.0),
        
               const SizedBox(height: 25,),
               //if (_showResultButton)
                NeuButton(
                  buttonColor: globals.textVioletLavanda,
                  onTap: () {
                    _showResultButton != true ? Get.toNamed('/home')
                  // TODO: Display the prompt from Gemini AI
                  : showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            //TODO: prompt from Gemini
                            'Science is a great fit for you! '),
                          content: Text(
                            //TODO: prompt from Gemini
                            'You clearly enjoy exploring the natural world and working with your hands, and your interest in helping sick people could lead to a rewarding career in healthcare.'
                           // _generatePrompt()
                            ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/home');
                                  // TODO: Implement navigation to next screen
                                },
                                child: Text("Next", 
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Lora'
                                    ),
                                  ),
                                )
                          ],
                        );
                      });
                  print(
                      "Show the result from Gemini AI: ${_generatePrompt()}");
                },
                  isIcon: false,
                  text: Text(
                    _showResultButton == true ? 'Show Result' : 'Back',
                    style: TextStyle(
                      color: globals.lavanda,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),),
                  newWidth: 150,
                ),
        
            const SizedBox(width: 50.0),
          ],
        ),
      ),
    );
  }
}
