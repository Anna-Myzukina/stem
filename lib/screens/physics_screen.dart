import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/button_small_icon_widget.dart';
import 'package:stem/widgets/custom_card_with_shadow.dart';
import 'package:url_launcher/url_launcher.dart';

class PhysicsScreen extends StatefulWidget {
  const PhysicsScreen({super.key});

  @override
  State<PhysicsScreen> createState() => _PhysicsScreenState();
}

class _PhysicsScreenState extends State<PhysicsScreen> {
  List _items = [];

  // Fetch content from the JSON file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/stem_cources.json');

    final data = await json.decode(response);
    setState(() {
      _items = data["disciplines"]["physics"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

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
                                image: AssetImage('assets/images/physics.png')),
                          )
                        ],
                      ),
                      const Text(
                        'Physics cources',
                        style: TextStyle(
                            color: globals.lightLavanda,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Column(
                      children: [
                        CustomCardWithShadow(
                          width: MediaQuery.of(context).size.width,
                          widget: InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Text(
                                  item['organization'],
                                  style: const TextStyle(
                                      color: globals.textVioletLavanda,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item['courseName'],
                                  style: const TextStyle(
                                      color: globals.textVioletLavanda,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 20),
                                const Stack(
                                  // TODO: Improve images
                                  children: [
                                    // Center(
                                    //   child: Image.network(
                                    //     height: 200,
                                    //     item['image']),
                                    // ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item['description'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                      color: globals.textVioletLavanda),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            _launchUrl(item['link']);
                                          }, // _launchUrl,
                                          child: const Row(
                                            children: [
                                              Text(
                                                  'Study',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: globals.greyLavanda),
                                                ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}