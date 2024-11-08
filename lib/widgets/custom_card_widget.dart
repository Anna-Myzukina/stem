import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CustomCardColourType { blue, pink, white, yellow }

class CustomCardWidget extends StatelessWidget {
  final String link;
  final String image;
  final String? guruName;
  final String? exersizeType;
  final String? levelType;
  final void Function()? onTap;
  final CustomCardColourType cardType;
  final bool isFlip;

  const CustomCardWidget(
      {
      required this.link,
      this.guruName,
      required this.image,
      this.exersizeType,
      this.levelType,
      this.onTap,
      this.isFlip = false,
      this.cardType = CustomCardColourType.blue,
      super.key,
      });

  @override
  Widget build(BuildContext context) {
    late Color cardColor;
    switch (cardType) {
      case CustomCardColourType.blue:
        cardColor = const Color(0xFFccf4f2);
      case CustomCardColourType.pink:
        cardColor = const Color(0xFFfae8fb);
      case CustomCardColourType.white:
        cardColor = Colors.white;
      case CustomCardColourType.yellow:
        cardColor = const Color(0xFFfbf6b5);
    }
    return InkWell(
      onTap: () {
        Get.toNamed(link);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.24,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: cardColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/avatar.jpg"),
                            ),
                            const SizedBox(width: 5),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      guruName ?? "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 3,
                                  // ),
                                  const Text(
                                    "STEM Guru",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  )
                                ]),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(exersizeType ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis
                              ),
                              ),
                            ),
                                        const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text('STEM',
                          style: TextStyle(
                            color: Colors.black38
                          ),),
                        const SizedBox(
                            width: 5,
                          ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFfbf6b3),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                            child: Center(child: Text('Mid',
                            style: TextStyle(
                              color: Color(0xffedc72f)
                            ),
                            )),
                          ),
                        )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(link);
                        },
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(child: Text("Start",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                            ),
                            )),
                          ),
                        ),
                      )
                          ],
                        ),
                      ),
          
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Transform.flip(
                      flipX: isFlip,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                          image: AssetImage(image),
                        )),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
