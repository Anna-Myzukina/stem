import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/button_small_icon_widget.dart';
import 'package:stem/widgets/custom_card_with_shadow.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.youtube.com/@cs50');

class ComputerScienceScreen extends StatelessWidget {
  const ComputerScienceScreen({super.key});

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
                      //image: DecorationImage(image: AssetImage('assets/images/ai_bg.png')),
                      color: globals.darkLavanda,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ButtonSmallIconWidget(
                              onTap: () {
                                Get.toNamed('/home');
                              },
                            ),
                          ),
                          const Expanded(flex: 2, child: Text('')),
                          const Expanded(
                            flex: 1,
                            child: Image(
                                height: 150,
                                image: AssetImage('assets/images/cs.png')),
                          )
                        ],
                      ),
                      const Text(
                        'Computer Science',
                        style: TextStyle(
                            color: globals.lightLavanda,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              CustomCardWithShadow(
                width: MediaQuery.of(context).size.width,
                widget: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Harvard University',
                        style: TextStyle(
                            color: globals.textVioletLavanda,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/cs50.jpeg')),
                          InkWell(
                            onTap: _launchUrl,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 50,
                                ),
                                child: Center(
                                  child: Image(
                                      height: 50,
                                      image: AssetImage(
                                          'assets/images/youtube.png')),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'CS50\'s Introduction to Computer Science',
                        style: TextStyle(color: globals.textVioletLavanda),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Read More',
                                style: TextStyle(color: globals.greyLavanda),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt,
                                color: Colors.grey,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomCardWithShadow(
                width: MediaQuery.of(context).size.width,
                widget: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Harvard University',
                        style: TextStyle(
                            color: globals.textVioletLavanda,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/cs50.jpeg')),
                          InkWell(
                            onTap: _launchUrl,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 50,
                                ),
                                child: Center(
                                  child: Image(
                                      height: 50,
                                      image: AssetImage(
                                          'assets/images/youtube.png')),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'CS50\'s Introduction to Computer Science',
                        style: TextStyle(color: globals.textVioletLavanda),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Read More',
                                style: TextStyle(color: globals.greyLavanda),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt,
                                color: Colors.grey,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomCardWithShadow(
                width: MediaQuery.of(context).size.width,
                widget: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Harvard University',
                        style: TextStyle(
                            color: globals.textVioletLavanda,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/cs50.jpeg')),
                          InkWell(
                            onTap: _launchUrl,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 50,
                                ),
                                child: Center(
                                  child: Image(
                                      height: 50,
                                      image: AssetImage(
                                          'assets/images/youtube.png')),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'CS50\'s Introduction to Computer Science',
                        style: TextStyle(color: globals.textVioletLavanda),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Read More',
                                style: TextStyle(color: globals.greyLavanda),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt,
                                color: Colors.grey,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomCardWithShadow(
                width: MediaQuery.of(context).size.width,
                widget: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Harvard University',
                        style: TextStyle(
                            color: globals.textVioletLavanda,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/cs50.jpeg')),
                          InkWell(
                            onTap: _launchUrl,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 50,
                                ),
                                child: Center(
                                  child: Image(
                                      height: 50,
                                      image: AssetImage(
                                          'assets/images/youtube.png')),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'CS50\'s Introduction to Computer Science',
                        style: TextStyle(color: globals.textVioletLavanda),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Read More',
                                style: TextStyle(color: globals.greyLavanda),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt,
                                color: Colors.grey,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomCardWithShadow(
                width: MediaQuery.of(context).size.width,
                widget: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Harvard University',
                        style: TextStyle(
                            color: globals.textVioletLavanda,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/cs50.jpeg')),
                          InkWell(
                            onTap: _launchUrl,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 50,
                                ),
                                child: Center(
                                  child: Image(
                                      height: 50,
                                      image: AssetImage(
                                          'assets/images/youtube.png')),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'CS50\'s Introduction to Computer Science',
                        style: TextStyle(color: globals.textVioletLavanda),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Read More',
                                style: TextStyle(color: globals.greyLavanda),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt,
                                color: Colors.grey,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
