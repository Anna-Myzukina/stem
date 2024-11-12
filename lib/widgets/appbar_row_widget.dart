import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:stem/src/constants.dart' as globals;

class AppBarRow extends StatelessWidget {
  final String? title;
  final String? image;
  final String? link;
  final String? textFromData;

  const AppBarRow({
    this.title,
    this.image,
    this.link,
    this.textFromData,
    super.key,
  });

  String getGreetingMessage() {
    final currentHour = DateTime.now().hour;

    if (currentHour < 12) {
      return 'Good\nMorning';
    } else if (currentHour < 18) {
      return 'Good\nAfternoon';
    } else {
      return 'Good\nEvening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: globals.darkLavanda,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                        boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(194, 147, 138, 158),
                          offset: Offset(5, 5),
                          blurRadius: 1)
                    ],
                    // border: Border(
                    //   bottom: BorderSide(
                    //     color: globals.darkLavanda
                    //   )
                    // ),
                    gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                        colors: [
                          globals.lavanda,
                          globals.darkLavanda,
                        ]
                      ),
                    ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title ?? getGreetingMessage(),
                style: GoogleFonts.lora(
                    color: globals.lightLavanda,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Get.toNamed(link ?? '/chat');
                },
                child: Container(
                  //height: 100,
                  child: Lottie.asset('assets/lottie/shpere.json'),
                  ),
                // badges.Badge(
                //   position: badges.BadgePosition.topEnd(top: 0, end: 2),
                //   badgeStyle:
                //       const badges.BadgeStyle(badgeColor: globals.badgeColorGreen),
                //   showBadge: true,
                //   ignorePointer: false,
                  // Container(
                  //   width: 110,
                  //   height: 110,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image:
                  //               AssetImage(image ?? 'assets/images/ai_agent.png'),
                  //           fit: BoxFit.cover),
                  //       borderRadius: const BorderRadius.all(Radius.circular(22)),
                  //       color: globals.lightLavanda),
                  //),
                //),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
