import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/widgets/custom_card_widget.dart';
import 'package:stem/src/constants.dart' as globals;

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> with TickerProviderStateMixin{
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;
    
      @override
      void initState() {
        super.initState();
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
        )..forward();  // Start the fade-in on initState.
      }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color(0xff242424),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          toolbarHeight: 91,
          leadingWidth: 76,
          backgroundColor: const Color(0xFFebdaff),
          leading: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: globals.lightPinkCard,
            onTap: () {
              Get.toNamed('/');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: Container(
                width: 60,
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF5b5b5b),
                    width: 3,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top STEM Practices',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              Text(
                'Exercises',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFebdaff),
                      Color(0xFFf7f0ff),
                      Color(0xFFFDFCFD)
                    ]),
              ),
          child: ListView(
            physics: const ScrollPhysics(),
            children: [
              Row(
                children: [
                  const SizedBox(width: 15),
                  Expanded(
                      flex: 1,
                      child: FadeTransition(
                        opacity: _controller1,
                        child: Container(
                          height: 45,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: Colors.white),
                          child: const Center(child: Text('Easy')),
                        ),
                      )),
                  const SizedBox(width: 5),
                  Expanded(
                      flex: 1,
                      child: FadeTransition(
                        opacity: _controller2,
                        child: Container(
                          height: 45,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: globals.lightYellowCard),
                          child: const Center(child: Text('Light')),
                        ),
                      )),
                  const SizedBox(width: 5),
                  Expanded(
                      flex: 1,
                      child: FadeTransition(
                        opacity: _controller3,
                        child: Container(
                          height: 45,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: globals.lightPinkCard),
                          child: const Center(child: Text('Middle')),
                        ),
                      )),
                  const SizedBox(width: 5),
                  Expanded(
                      flex: 1,
                      child: FadeTransition(
                        opacity: _controller4,
                        child: Container(
                          height: 45,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: globals.lightBlueCard),
                          child: const Center(child: Text('Hard')),
                        ),
                      )),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 200.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child:
                      ListView(
                        scrollDirection: Axis.vertical, 
                        children: const [
                    CustomCardWidget(
                      link: "/exercise",
                      cardType: CustomCardColourType.blue,
                      image: "",
                      isFlip: true,
                      guruName: 'AI Science',
                      exersizeType: 'All Type',
                    ),
                    SizedBox(height: 15),
                    CustomCardWidget(
                      link: "/exercise",
                      cardType: CustomCardColourType.pink,
                      image: "",
                      guruName: 'AI Technology',
                      exersizeType: 'Programming',
                    ),
                    SizedBox(height: 15),
                    CustomCardWidget(
                      link: "/exercise",
                      cardType: CustomCardColourType.yellow,
                      image: "",
                      guruName: 'AI Engineering',
                      exersizeType: 'Robototechnics',
                      isFlip: true,
                    ),
                    SizedBox(height: 15),
                    CustomCardWidget(
                      link: "/exercise",
                      cardType: CustomCardColourType.white,
                      guruName: 'AI Mathematics',
                      image: "",
                      exersizeType: 'All Kinds',
                    ),
                    SizedBox(height: 165),
                  ]),
                ),
              ),

            ],
          ),
        ),
      
    );
  }
}
