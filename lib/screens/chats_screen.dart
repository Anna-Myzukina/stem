import 'package:avatar_glow/avatar_glow.dart';
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
  String aiText = 'You are not alone';

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
    _speech = speach.SpeechToText();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        //toolbarHeight: 91,
        //leadingWidth: 76,
        backgroundColor: globals.darkLavanda,
        leading: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: globals.lightPinkCard,
          onTap: () {
            Get.toNamed('/');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16),
            child: Container(
              width: 100,
              height: 100,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Speaking to AI bot',
              style: GoogleFonts.lora(
                  fontSize: 20.0,
                  color: globals.textVioletLavanda,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
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
                          content: const Text(
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
                                child: const Text("Next", 
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Lora'
                                    ),
                                  ),
                                )
                          ],
                        );
                      });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: Container(
                width: 100,
                height: 100,
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
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Go a head, I\'m listening',
                    style: TextStyle(
                        color: globals.lavandaCard,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Lottie.asset('assets/lottie/shpere.json'),
            //Lottie.network('https://lottie.host/embed/ce2a6d09-648e-4e70-8165-0700da3f38f4/FUHnxn9bdg.json'),
            const Text('Speach to text'),
            Padding(
              padding: const EdgeInsets.only(bottom: 200.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Chat icon'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: AvatarGlow(
                        startDelay: const Duration(milliseconds: 1000),
                        glowColor: globals.lavandaCard,
                        glowShape: BoxShape.circle,
                        animate: true,
                        curve: Curves.fastOutSlowIn,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(999.0),
                          onTap: () {
                            startListening();
                            isListening != isListening;
                          },
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircleAvatar(
                              backgroundColor: globals.darkLavanda,
                              radius: 999.0,
                              child: Icon(
                                  isListening
                                      ? FontAwesomeIcons.microphoneSlash
                                      : FontAwesomeIcons.microphone,
                                  color: Colors.white,
                                  size: 30.0),
                            ),
                          ),
                        )),
                  ),
                  Text('Close')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
