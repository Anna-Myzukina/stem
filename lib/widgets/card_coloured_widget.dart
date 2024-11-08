import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/src/constants.dart' as globals;

class CardColouredWidget extends StatelessWidget {
  final String? title;
  final String? text;
  final String? link;
  final Color? bgColour;
  final String? btnTitle;
  final Color? btnBgColour;

  const CardColouredWidget({
    this.title,
    this.text,
    this.link,
    this.bgColour,
    this.btnTitle,
    this.btnBgColour,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: () {
            Get.toNamed(link ?? '');
          },
          child: Container(
            decoration: BoxDecoration(
                color: bgColour ?? globals.greenCard,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyle(
                        color: globals.lightLavanda,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text ?? '',
                    style: TextStyle(
                        color: globals.lightLavanda,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: btnBgColour ?? Color(0xFF70bdb5),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        btnTitle ?? '',
                        style: TextStyle(
                            color: globals.lightLavanda,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}