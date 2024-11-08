import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExersizeScreen extends StatefulWidget {
  const ExersizeScreen({super.key});

  @override
  State<ExersizeScreen> createState() => _ExersizeScreenState();
}

class _ExersizeScreenState extends State<ExersizeScreen> {
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xff242424),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          toolbarHeight: 91,
          leadingWidth: 76,
          backgroundColor: const Color(0xff242424),
          leading: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: const Color(0xFFfae8fb),
            onTap: () {
              Get.toNamed('/');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 6.0, bottom: 6.0),
              child: Container(
                width: 60,
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF5b5b5b),
                    width: 3,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
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
          title: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF535353),
                      //Color(0xFF343434),
                      Color(0xFF393939),
                    ]),
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                border: Border.all(
                  color: const Color(0xFF535353),
                )),
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Guru',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'STEM consultant',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18.0, top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STEM practices',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "With AI Guru",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Transform.flip(
              flipX: true,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/avatar.jpg"))),
              ),
            ),
            Column(
              children: [
                Stack(
                  //clipBehavior: Clip.hardEdge,
                  //textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: InkWell(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40)),
                        onTap: () {
                          Get.toNamed("/exercise_details");
                        },
                        child: Container(
                          width: 400,
                          height: 220,
                          decoration: const BoxDecoration(
                              color: Color(0xffd7f2f4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40))),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 28.0, left: 8),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Total time',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      '1 hour',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Total score"',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      '550 point',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Total progress',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      '20 points',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 250,
                        height: 120,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40))),
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 25.0, left: 25),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'STEM and Guru',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Text(
                                  'Details',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )
                              ]),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: const BoxDecoration(
                            color: Color(0xff242424),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40))),
                        child: const Center(
                            child: Text(
                          'Chat',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
  }
}
