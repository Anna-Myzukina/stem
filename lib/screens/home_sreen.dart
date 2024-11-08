import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stem/screens/calming_screen.dart';
import 'package:stem/screens/chats_screen.dart';
import 'package:stem/screens/dashboard_screen.dart';
import 'package:stem/screens/levelup_screen.dart';
import 'package:stem/widgets/custom_bottom_bar.dart';
import 'package:stem/src/constants.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _currentIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.house,
             color: _currentIndex == 0 ? globals.textVioletLavanda : globals.greyLavanda)),
            BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.rocketchat,
            color: _currentIndex == 1 ? globals.textVioletLavanda : globals.greyLavanda)),
            BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.heart,
            color: _currentIndex == 2 ? globals.textVioletLavanda : globals.greyLavanda)),
            BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.chartLine,
            color: _currentIndex == 3 ? globals.textVioletLavanda : globals.greyLavanda))
        ], 
        onItemSelected:  (index) => setState(() => _currentIndex = index),
        ),
      body: getBody(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const DashboardScreen(),
      const ChatsScreen(),
      const CalmingScreen(),
      const LevelUpScreen()
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}