import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:stem/features/vertex_ai/models/message_model.dart';
import 'package:stem/widgets/messages_text_chat_widget.dart';
import 'package:stem/src/constants.dart' as globals;

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<MessageModel> messagesPrompt = [];
  final bool isPrompt = true;
  final bool isMessageNull = true;

  late final GenerativeModel model;

  @override
  void initState() {
    super.initState();
    // Initialize the model
    model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash',
    );
  }

  Future<void> sendMessage() async {
    final message = messageController.text;

    setState(() {
      messageController.clear();
      messagesPrompt.add(
          MessageModel(isUser: true, message: message, date: DateTime.now()));
    });

    try {
      final content = [Content.text(message)];
      final response = await model.generateContent(content);
      //final text = response.text;

      setState(() {
        messagesPrompt.add(MessageModel(
            isUser: false, message: response.text ?? "", date: DateTime.now()));
      });
    } catch (e) {
      print('Error generating response: $e');
      // Handle the error, e.g., show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        //height: MediaQuery.of(context).size.height,
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
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 40),
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
                  onTap: () {},
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
                child: ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: messagesPrompt.length,
                    itemBuilder: (context, index) {
                      final message = messagesPrompt[index];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          message.isUser == false
                              ? 
                              Expanded(
                                child: SizedBox(
                                    width: 75,
                                    height: 75,
                                    child:
                                    Lottie.asset('assets/lottie/shpere.json')
                                        //Image.asset('assets/images/ai_agent.png'),
                                  ),
                              )
                              : const SizedBox(),
                          MessagesTextChatWidget(
                              isUser: message.isUser,
                              message: message.message,
                              date: DateFormat('HH:mm').format(message.date)),
                          message.isUser == true
                              ? Expanded(
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child:
                                        Image.asset('assets/images/user.png'),
                                  ),
                              )
                              : const SizedBox(),
                        ],
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 15,
                    child: TextFormField(
                      style: const TextStyle(color: globals.lavandaCard),
                      controller: messageController,
                      decoration: InputDecoration(
                          fillColor: globals.lightLavanda,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: const Text('Enter Your Message')),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(12),
                    iconSize: 30,
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(globals.lavandaCard),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        shape: const WidgetStatePropertyAll(CircleBorder())),
                    onPressed: () {
                      sendMessage();
                      isMessageNull != isMessageNull;
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
