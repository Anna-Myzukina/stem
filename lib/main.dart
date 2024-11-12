//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/screens/message_screen.dart';
import 'firebase_options.dart';
import 'package:stem/screens/astronomy_screen.dart';
import 'package:stem/screens/biology_screen.dart';
import 'package:stem/screens/calming_screen.dart';
import 'package:stem/screens/chats_screen.dart';
import 'package:stem/screens/chemistry_screen.dart';
import 'package:stem/screens/cl_generator_screen.dart';
import 'package:stem/screens/computer_science_screen.dart';
import 'package:stem/screens/cv_generator_screen.dart';
import 'package:stem/screens/dashboard_screen.dart';
import 'package:stem/screens/engineering_screen.dart';
import 'package:stem/screens/environmental_science_screen.dart';
import 'package:stem/screens/first_screen.dart';
import 'package:stem/screens/home_sreen.dart';
import 'package:stem/screens/login/login_screen.dart';
import 'package:stem/screens/mathematic_screen.dart';
import 'package:stem/screens/mathematical_facts_screen.dart';
import 'package:stem/screens/physics_screen.dart';
import 'package:stem/screens/progress_screen.dart';
import 'package:stem/screens/stem_information_screen.dart';
import 'package:stem/screens/stem_list_screen.dart';
import 'package:stem/screens/exercise_screen.dart';
import 'package:stem/screens/quiz_screen.dart';
import 'package:stem/screens/user_profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  // } catch (e) {
    //print('Unable to initialze Firebase');
    runApp(const MyApp());
  //}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.downToUp,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFeddeff),
            fontFamily: 'Lora'),
        initialRoute: "/",
        getPages: [
          GetPage(name: "/login", page: () => const LoginScreen()),
          GetPage(name: "/first", page: () => const FirstScreen()),
          GetPage(name: "/home", page: () => const HomeScreen()),
          GetPage(name: "/dashboard", page: () => const DashboardScreen()),
          GetPage(name: "/user_profile", page: () => const UserProfileScreen()),
          GetPage(name: "/exercise", page: () => const ExersizeScreen()),
          GetPage(
              name: "/exercise_details", page: () => const ExersizeScreen()),
          GetPage(name: "/stem_list", page: () => const StemListScreen()),
          GetPage(
              name: "/stem_information",
              page: () => const StemInformationScreen()),
          GetPage(name: "/progress", page: () => const ProgressScreen()),
          GetPage(
              name: "/computer_science",
              page: () => const ComputerScienceScreen()),
          GetPage(name: "/mathematic", page: () => const MathematicScreen()),
          GetPage(name: "/physic", page: () => const PhysicsScreen()),
          GetPage(name: "/engineering", page: () => const EngineeringScreen()),
          GetPage(name: "/biology", page: () => const BiologyScreen()),
          GetPage(name: "/chemistry", page: () => const ChemistryScreen()),
          GetPage(name: "/astronomy", page: () => const AstronomyScreen()),
          GetPage(
              name: "/environmental_science",
              page: () => const EnvironmentalScienceScreen()),
          GetPage(name: "/calming", page: () => const CalmingScreen()),
          GetPage(
              name: "/math_facts", page: () => const MathematicalFactsScreen()),
          GetPage(name: "/quiz", page: () => const StemQuizScreen()),
          GetPage(name: "/cv_generator", page: () => const CvGeneratorScreen()),
          GetPage(
              name: "/cl_generator",
              page: () => const CoverLaterGeneratorScreen()),
          GetPage(name: "/chat", page: () => const ChatsScreen()),
          GetPage(name: "/message", page: () => const MessageScreen())
        ],
        home: const ChatsScreen()
            //const HomeScreen()
            // DashboardScreen()
            //const LoginScreen()
        //SignUpScreen()
        // const StemQuizScreen()
        //const FirstScreen()
        //LevelUpScreen()
        //CardListScreen()
        //AnimatedContainersScreen()
        //const CalmingScreen()
        );
  }
}
