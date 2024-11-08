import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:stem/src/constants.dart' as globals;

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: 0, end: 2),
          badgeStyle: const badges.BadgeStyle(badgeColor: Color(0xffb8ff8d)),
          showBadge: true,
          ignorePointer: false,
          onTap: () {},
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/avatar.jpg",
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(22)),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              // gradient: const LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [
              //       Color(0xFFebdaff),
              //       Color(0xFFf7f0ff),
              //       Color(0xFFFDFCFD)
              //     ]),
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              border: Border.all(
                color: globals.lightLavanda,
              ),
            ),
            child: const Center(
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.search,
                    color: globals.greyLavanda,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Find Cources',
                    style: TextStyle(color: Color(0xFF5b5b5b), fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
