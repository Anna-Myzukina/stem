import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stem/widgets/custom_card_with_shadow.dart';

import 'package:stem/src/constants.dart' as globals;

class RealworldProjectsWidget extends StatelessWidget {
  const RealworldProjectsWidget({
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
                FontAwesomeIcons.earthAmericas,
                color: globals.textVioletLavanda,
                size: 26,
              ),
              SizedBox(width: 8),
              Text(
                'Real-world Projects:',
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
                  'Hackathons',
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
                                'assets/images/hackathons.jpg'))),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Participate in online hackathons and contribute to open-source projects.',
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

