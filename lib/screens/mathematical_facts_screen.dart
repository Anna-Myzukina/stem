import 'package:flutter/material.dart';
import 'package:stem/src/constants.dart' as globals;

class MathematicalFactsScreen extends StatefulWidget {
  const MathematicalFactsScreen({super.key});

  @override
  State<MathematicalFactsScreen> createState() => _MathematicalFactsScreenState();
}

class _MathematicalFactsScreenState extends State<MathematicalFactsScreen> {
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
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Mathematical Facts',
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
            ],
          ),
        ),
      ),
    );
  }
}