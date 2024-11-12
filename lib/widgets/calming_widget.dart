import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/custom_card_with_shadow.dart';

class CalmingWidget extends StatefulWidget {
  const CalmingWidget({super.key});

  @override
  State<CalmingWidget> createState() => _CalmingWidgetState();
}

class _CalmingWidgetState extends State<CalmingWidget> {
    var indexrandom = Random().nextInt(4);

  List _items = [];

  _CalmingWidgetState() {
    readJson();
  }

    Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/relax.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["relax"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const Row(
          children: [
            SizedBox(width: 8),
            Icon(
              FontAwesomeIcons.music,
              color: globals.textVioletLavanda,
              size: 26,
            ),
            SizedBox(width: 8),
            Text(
              'Calming Space:',
              style: globals.h1DarkVioletText,
            )
          ],
        ),
        const SizedBox(height: 10),
        CustomCardWithShadow(
          width: MediaQuery.of(context).size.width,
          widget: InkWell(
            onTap: () {},
            child: Column(
              children: [
                _items.isEmpty
                            ? const Text('Loading...')
                            :  Text(
                  //'The Golden Ratio',
                  _items[indexrandom]["title"],
                  style: const TextStyle(
                      color: globals.textVioletLavanda,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:  _items.isEmpty
                            ? const Text('Loading...')
                            : Image(
                          image: AssetImage(_items[indexrandom]['image'])),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.toNamed('/calming');
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Listen',
                            style: TextStyle(
                              fontSize: 20,
                              color: globals.greyLavanda),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.grey,
                            size: 20,
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}