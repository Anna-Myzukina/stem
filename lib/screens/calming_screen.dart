import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stem/widgets/appbar_row_widget.dart';
import 'package:stem/widgets/custom_card_with_shadow.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:url_launcher/url_launcher.dart';

class CalmingScreen extends StatefulWidget {
  const CalmingScreen({super.key});

  @override
  State<CalmingScreen> createState() => _CalmingScreenState();
}

class _CalmingScreenState extends State<CalmingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;

  List _items = [];

  // Fetch content from the JSON file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/relax.json');

    final data = await json.decode(response);
    setState(() {
      _items = data["relax"];
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

    _controller1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _controller2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _controller3 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();
    _controller4 = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..forward(); // Start the fade-in on initState.
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          //height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage('assets/images/lavanda_1.jpg')),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFebdaff),
                  Color(0xFFf7f0ff),
                  Color(0xFFFDFCFD)
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppBarRow(
                      title: 'Calming\nspace',
                    ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.circleCheck,
                    color: globals.textVioletLavanda,
                    ),
                    const SizedBox(width: 10),
                    Text('Choose Your feeling today?',
                    style: GoogleFonts.lora(
                      color: globals.textVioletLavanda,
                      fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              MoodRow(controller1: _controller1, controller2: _controller2, controller3: _controller3, controller4: _controller4),
              const SizedBox(height: 25),
              
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(176, 156, 139, 255),
                    border: Border.all(
                      color: const Color.fromARGB(174, 101, 34, 178),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                  child: Center(
                    child: Text('I prepared calming playlist:',
                    style: GoogleFonts.lora(
                      color: globals.lightLavanda,
                      fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Column(
                      children: [
                        CustomCardWithShadow(
                          width: MediaQuery.of(context).size.width,
                          widget: InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                      color: globals.textVioletLavanda,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 20),
                                Stack(
                                  children: [
                                    Center(
                                      child: Image(
                                          height: 200,
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              item['image'])),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _launchUrl(item['link']);
                                      }, // _launchUrl,
                                      child: const Padding(
                                          padding: EdgeInsets.only(
                                            top: 50,
                                          ),
                                          child: Center(
                                            child: Image(
                                                height: 50,
                                                image: AssetImage(
                                                    'assets/images/youtube.png')),
                                          )),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  })
              
            ],
          ),
        ),
      ),
    );
  }
}

class MoodRow extends StatelessWidget {
  const MoodRow({
    super.key,
    required AnimationController controller1,
    required AnimationController controller2,
    required AnimationController controller3,
    required AnimationController controller4,
  }) : _controller1 = controller1, _controller2 = controller2, _controller3 = controller3, _controller4 = controller4;

  final AnimationController _controller1;
  final AnimationController _controller2;
  final AnimationController _controller3;
  final AnimationController _controller4;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Expanded(
            flex: 1,
            child: FadeTransition(
              opacity: _controller1,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: globals.lavanda
                  ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                    color: Colors.white),
                child: const Center(child: Text('Calm')),
              ),
            )),
        const SizedBox(width: 5),
        Expanded(
            flex: 1,
            child: FadeTransition(
              opacity: _controller2,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: globals.lavanda
                  ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                    color: globals.lightYellowCard),
                child: const Center(child: Text('Tired')),
              ),
            )),
        const SizedBox(width: 5),
        Expanded(
            flex: 1,
            child: FadeTransition(
              opacity: _controller3,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: globals.lavanda
                  ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                    color: globals.lightPinkCard),
                child: const Center(child: Text('Sad')),
              ),
            )),
        const SizedBox(width: 5),
        Expanded(
            flex: 1,
            child: FadeTransition(
              opacity: _controller4,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: globals.lavanda
                  ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                    color: globals.lightBlueCard),
                child: const Center(child: Text('Happy')),
              ),
            )),
        const SizedBox(width: 15),
      ],
    );
  }
}
