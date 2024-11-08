import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stem/src/constants.dart' as globals;

class SmallCard extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final double? fontSise;

  const SmallCard(
      {super.key, this.icon, this.title, this.onTap, this.fontSise});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: globals.lavandaCard,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: globals.lavanda),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: globals.greyBorder,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Icon(
                            icon ?? FontAwesomeIcons.pen,
                            color: globals.greyLavanda,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        title ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          color: globals.textVioletLavanda,
                          fontSize: fontSise ?? 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}