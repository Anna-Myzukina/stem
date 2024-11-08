import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/custom_card_with_shadow.dart';

class MathematicalFactsWidget extends StatefulWidget {
  const MathematicalFactsWidget({
    super.key,
  });

  @override
  State<MathematicalFactsWidget> createState() =>
      _MathematicalFactsWidgetState();
}

class _MathematicalFactsWidgetState extends State<MathematicalFactsWidget> {
  var indexrandom = Random().nextInt(31);

  List _items = [];

  _MathematicalFactsWidgetState() {
    readJson();
  }

    Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/math_fact.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["fact"];
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
         Row(
          children: [
            SizedBox(width: 8),
            Icon(
              FontAwesomeIcons.squareRootVariable,
              color: globals.textVioletLavanda,
              size: 26,
            ),
            SizedBox(width: 8),
            Text(
              'Mathematical Facts:',
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
                  style: TextStyle(
                      color: globals.textVioletLavanda,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image(
                          image: AssetImage('assets/images/mona_liza.png')),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: 
                         _items.isEmpty
                            ? const Text('Loading...')
                            :  Text(
                           _items[indexrandom]["fact"],
                          //'The Golden Ratio, a mathematical ratio found in nature and art, can be seen in the proportions of the human body, the Parthenon, and the Mona Lisa.',
                          style: TextStyle(color: globals.textVioletLavanda),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.toNamed('/math_facts');
                  },
                  child: const Padding(
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
