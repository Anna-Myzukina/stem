import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/multicolor_circular_progress_bar_widget.dart';
import 'package:stem/widgets/stem_count_row_widget.dart';
import 'package:stem/widgets/stem_row_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {


  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.lavanda,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          toolbarHeight: 91,
          leadingWidth: 76,
          backgroundColor: const Color.fromARGB(124, 40, 10, 75),
          title:  const Text(
                "My progess",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: globals.lightLavanda,),
              ),
          leading: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Get.toNamed('/');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: globals.lightLavanda,
                  border: Border.all(
                    color: globals.lightLavanda,
                    width: 3,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: globals.textVioletLavanda,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [buildTop(), buildContent()],
        ));
  }

  Widget buildCoverImage() => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image(
            fit: BoxFit.cover,
            height: coverHeight,
            image: const AssetImage(
              "assets/images/mathem.png",
            )),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage("assets/images/avatar.jpg"),
      );

  Widget buildStemRow() => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: StemRowWidget(),
    ),
  );

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, 
        child: buildStemRow()//buildProfileImage()
        )
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          const SizedBox(height: 8),
          MulticolorCircularProgresBarWidget(
            size: MediaQuery.of(context).size.width * 0.6,
            values: const [0.2, 0.1, 0.3, 0.4],
            colors: const [
              globals.deepPink,
              globals.lightOrange,
              globals.lightGreen,
              globals.lightBlue
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: StemCountRowWidget(
                        stemTipe: 'Mathematic',
                        stemTitle: '30%',
                        stemColor: globals.deepPink,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: StemCountRowWidget(
                        stemTipe: 'Science',
                        stemTitle: '10%',
                        stemColor: globals.lightGreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: StemCountRowWidget(
                        stemTipe: 'Engineering',
                        stemTitle: '40%',
                        stemColor: globals.lightOrange,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: StemCountRowWidget(
                        stemTipe: 'Technology',
                        stemTitle: '30%',
                        stemColor: globals.lightBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
