import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/custom_card_with_shadow.dart';

class InfluentalWomenWidget extends StatelessWidget {
  const InfluentalWomenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const Row(
            children: [
              SizedBox(width: 8),
              Icon(
                FontAwesomeIcons.personDress,
                color: globals.textVioletLavanda,
                size: 26,
              ),
              SizedBox(width: 8),
              Text(
                'Influential women:',
                style: globals.h1DarkVioletText,
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
            child: const Column(
              children: [
                Text(
                  'Hypatia of Alexandria',
                  style: TextStyle(
                      color: globals.textVioletLavanda,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image(
                            image: AssetImage(
                                'assets/images/hipatia.jpeg'))),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'A Greek Neoplatonist philosopher, astronomer, and mathematician, Hypatia was one of the greatest intellectuals of the Hellenistic world.',
                          style:
                              TextStyle(color: globals.textVioletLavanda),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
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
    );
  }
}

