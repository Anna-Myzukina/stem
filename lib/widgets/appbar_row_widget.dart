import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:badges/badges.dart' as badges;

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
    return Row(
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
              Get.toNamed(link ?? 'user_profile');
            },
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 2),
              badgeStyle:
                  const badges.BadgeStyle(badgeColor: globals.badgeColorGreen),
              showBadge: true,
              ignorePointer: false,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage(image ?? 'assets/images/ai_agent.png'),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    color: globals.lightLavanda),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
