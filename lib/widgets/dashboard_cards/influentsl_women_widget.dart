import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/custom_card_with_shadow.dart';
import 'package:url_launcher/url_launcher.dart';

class InfluentalWomenWidget extends StatefulWidget {
  const InfluentalWomenWidget({
    super.key,
  });

  @override
  State<InfluentalWomenWidget> createState() => _InfluentalWomenWidgetState();
}

class _InfluentalWomenWidgetState extends State<InfluentalWomenWidget> {
  var indexrandom = Random().nextInt(6);

  List _items = [];

  _InfluentalWomenWidgetState() {
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/inspiring_women.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["women"];
    });
  }

    Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');

    }
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
            const SizedBox(width: 8),
            const Icon(
              FontAwesomeIcons.heart,
              color: globals.textVioletLavanda,
              size: 26,
            ),
            const SizedBox(width: 8),
            Text(
              'Influential women:',
              style: GoogleFonts.lora(
                  fontSize: 20,
                  color: globals.textVioletLavanda,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCardWithShadow(
          width: MediaQuery.of(context).size.width,
          widget: InkWell(
            onTap: () {},
            child: Column(
              children: [
                //'Hypatia of Alexandria',
                _items.isEmpty
                    ? const Text('Loading...')
                    : Text(
                        _items[indexrandom]["name"],
                        style: GoogleFonts.lora(
                            fontSize: 18,
                            color: globals.textVioletLavanda,
                            fontWeight: FontWeight.bold),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: _items.isEmpty
                            ? const Text('Loading...')
                            : Image(
                                image:
                                    AssetImage(_items[indexrandom]["image"]))),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: _items.isEmpty
                            ? const Text('Loading...')
                            : Text(
                                _items[indexrandom]["fact"],
                                style: const TextStyle(
                                    color: globals.textVioletLavanda),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                    onTap: () {
                      _launchUrl(
                         _items.isEmpty
                    ? const Text('Loading...')
                    : _items[indexrandom]['link']);
                    },
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Read More',
                            style: TextStyle(
                                color: globals.greyLavanda, fontSize: 20),
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
