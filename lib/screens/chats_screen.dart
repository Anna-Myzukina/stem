import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/small_card_widget.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration:const BoxDecoration(
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
                    image: DecorationImage(image: AssetImage('assets/images/ai_bg.png')),
                    color: globals.darkLavanda,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: const Row(
                  children: [
                     Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'You are not Alone!',
                          style: TextStyle(
                              color: globals.lightLavanda,
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
                )
              ),
              const Row(
                  children: [
                    SmallCard(
                    icon: FontAwesomeIcons.microphone,
                    title: 'Talk to AI',
                  ),
                  SizedBox(width: 10,),
                   SmallCard(
                    icon: FontAwesomeIcons.pen,
                    title: 'Chat With AI',
                  ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}