import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/src/constants.dart' as constant;

class StemListScreen extends StatelessWidget {
  const StemListScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/desert_7.png'),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      const Color.fromARGB(227, 71, 94, 98),
                      Colors.black.withOpacity(0)
                    ]),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  //1 search field
                  // const CustomAppBar(
                  //   userImage: "assets/images/avatar.jpg",
                  //   buttonColor: constant.lightPinkCard,
                  // ),
                  Expanded(
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed("/user_profile");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: constant.pinkOrange,
                                        border: Border.all(
                                          color: const Color(0xFF5b5b5b),
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(22)),
                                      ),
                                      child: const Center(
                                        child: Text('Practice'),
                                      ),
                                    ),
                                  ),
                                ),
                                //3 row with tabs
                                const SizedBox(height: 10),
                                // const Row(
                                //   children: [
                                //     SizedBox(width: 15),
                                //     SizedBox(width: 5),
                                //     SizedBox(width: 5),
                                //     SizedBox(width: 5),
                                //     SizedBox(width: 15),
                                //   ],
                                // ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Check progress',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: InkWell(
                                    onTap: () {
                                    Get.toNamed("/exercise");
                                     },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: constant.lightBlueCard,
                                        border: Border.all(
                                          color: const Color(0xFF5b5b5b),
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(22)),
                                      ),
                                      child: const Center(
                                        child: Text('Test'),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Interactive game',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: InkWell(
                                    onTap: () {
                                    Get.toNamed("/exercise");
                                     },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: constant.lightYellowCard,
                                        border: Border.all(
                                          color: const Color(0xFF5b5b5b),
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(22)),
                                      ),
                                      child: const Center(
                                        child: Text('Play'),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'AI Mentor',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: InkWell(
                                    onTap: () {
                                    Get.toNamed("/exercise");
                                     },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: constant.lightPinkCard,
                                        border: Border.all(
                                          color: const Color(0xFF5b5b5b),
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(22)),
                                      ),
                                      child: const Center(
                                        child: Text('Conversation'),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 770,
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
