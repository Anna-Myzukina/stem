import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart' as speach;
import 'package:stem/src/constants.dart' as globals;

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late speach.SpeechToText _speech;
  bool isListening = false;
  String aiText = 'Let\'s talk! 💗 All you need is just to press mic button and talk! I\'m listening.';
  String? generatedText;
  late final GenerativeModel model;

  final prompt = [
    Content.text(
        'I\'m a senior Java Script developer. Write a cover letter for me.')
  ];

  Future<void> _generateText() async {
    try {
      // Use generateContent for non-streaming response
      final response = await model.generateContent(prompt);
      setState(() {
        generatedText = response.text;
      });
    } catch (e) {
      print('Error generating text: $e');
      // Handle the error, e.g., show an error message to the user
    }
  }

  void startListening() async {
    if (!isListening) {
      bool available = await _speech.initialize(
          // onStatus: (val) => print('onStatus: $val'),
          // onError: (val) => print('onError: $val'),
          );
      if (available) {
        setState(() => isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            aiText = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => isListening = false);
      _speech.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    model =
        FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

    _speech = speach.SpeechToText();

    // Call the function to generate text when the widget initializes
    _generateText();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: globals.lightPinkCard,
                  onTap: () {
                    Get.toNamed('/');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(127, 181, 126, 220),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Speaking to AI bot',
                  style: GoogleFonts.lora(
                      fontSize: 22.0,
                      color: globals.textVioletLavanda,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: globals.lightPinkCard,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                                //TODO: prompt from Gemini
                                'Science is a great fit for you! '),
                            content: Text(
                              //TODO: prompt from Gemini
                              generatedText ?? 'Generate response...',
                              //'You clearly enjoy exploring the natural world and working with your hands, and your interest in helping sick people could lead to a rewarding career in healthcare.'
                              // _generatePrompt()
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/home');
                                },
                                child: const Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Lora'),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    
                                  },
                                  icon: const Icon(FontAwesomeIcons.xmark))
                            ],
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(127, 181, 126, 220),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                      child: const Center(
                        child: Icon(FontAwesomeIcons.ellipsis,
                            size: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                  height: 350, child: Lottie.asset('assets/lottie/shpere.json')),
            ),
            //Lottie.network('https://lottie.host/embed/ce2a6d09-648e-4e70-8165-0700da3f38f4/FUHnxn9bdg.json'),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 200,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        //AI text, example: 'Go a head, I\'m listening',
                        aiText,
                        style: const TextStyle(
                            color: globals.lavandaCard,
                            //fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(999.0),
                    onTap: () {
                      Get.toNamed('/message');
                    },
                    child: const SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Icon(FontAwesomeIcons.keyboard,
                          color: globals.greyLavanda, size: 30.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: AvatarGlow(
                        //repeat: isListening ? true : false,
                        startDelay: const Duration(milliseconds: 1000),
                        glowColor: globals.lavandaCard,
                        glowShape: BoxShape.circle,
                        animate: true,
                        curve: Curves.fastOutSlowIn,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(999.0),
                          onTap: () {
                            startListening();
                          },
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircleAvatar(
                              backgroundColor: globals.darkLavanda,
                              radius: 999.0,
                              child: Icon(
                                  isListening
                                      ? FontAwesomeIcons.microphone
                                      : FontAwesomeIcons.microphoneSlash,
                                  color: Colors.white,
                                  size: 30.0),
                            ),
                          ),
                        )),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(999.0),
                    onTap: () {
                      Get.toNamed('/home');
                    },
                    child: const SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Icon(FontAwesomeIcons.xmark,
                          color: globals.greyLavanda, size: 30.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
