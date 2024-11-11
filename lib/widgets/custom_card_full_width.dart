import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stem/widgets/button_small_icon_widget.dart';
import 'package:stem/src/constants.dart' as globals;

enum CustomCardGradientType {
  purple,
  blue,
  green,
  red,
  orange,
  brown,
  lightBlue,
  grey
}

class CustomCardModuleFullWidth extends StatelessWidget {
  final String link;
  final String? image;
  final String? title;
  final String? list1;
  final String? list2;
  final String? list3;
  final String? list4;
  final Offset offset;
  final void Function()? onTap;
  final CustomCardGradientType cardType;

  const CustomCardModuleFullWidth({
    required this.link,
    this.image,
    this.title,
    this.list1,
    this.list2,
    this.list3,
    this.list4,
    this.offset = const Offset(-3, -3),
    this.onTap,
    this.cardType = CustomCardGradientType.purple,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late LinearGradient gradient;
    switch (cardType) {
      case CustomCardGradientType.green:
        gradient = const LinearGradient(colors: [
          Color.fromARGB(255, 115, 239, 204),
          Color(0xFF30BE96),
          Color.fromARGB(255, 12, 149, 110),
          Color.fromARGB(255, 4, 57, 42),
        ]);
      case CustomCardGradientType.purple:
        gradient = const LinearGradient(colors: [
          Color(0xFFDA65AD),
          Color(0xFFBD77C7),
          Color(0xFF928DE0),
          Color(0xFF7892E7)
        ]);
      case CustomCardGradientType.blue:
        gradient = const LinearGradient(colors: [
          Color(0xFF4BE1EC),
          Color(0xFF6699FF),
          Color(0xFF2F80ED),
          Color.fromARGB(255, 62, 62, 205),
          Color(0xFF000066)
        ]);
      case CustomCardGradientType.red:
        gradient = const LinearGradient(colors: [
          Color(0xFFFA7CBB),
          Color(0xFFF14658),
          Color(0xFFF40076),
          Color(0xFF342711)
        ]);
      case CustomCardGradientType.orange:
        gradient = const LinearGradient(colors: [
          Color(0xFFFCD8A9),
          Color(0xFFF6BAA3),
          Color(0xFFF1978F),
          Color(0xFFF892A0),
          Color(0xFFFF6B00)
        ]);
      case CustomCardGradientType.brown:
        gradient = const LinearGradient(colors: [
          Color(0xFFC0C181),
          Color(0xFF9D9D61),
          Color(0xFF565620),
          Color(0xFF333201)
        ]);
      case CustomCardGradientType.lightBlue:
        gradient = const LinearGradient(colors: [
          Color(0xFF66FEFF),
          Color(0xFF5AEBED),
          Color(0xFF269F9F),
          Color(0xFF006766)
        ]);
      case CustomCardGradientType.grey:
        gradient = const LinearGradient(colors: [
          Color(0xFFD3E2EF),
          Color(0xFFA4B4C2),
          Color(0xFF8D9DAB),
          Color(0xFF5F6F7D),
          Color(0xFF18202D)
        ]);
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
                color: const Color(0xfff1f4f8),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.white, offset: offset, blurRadius: 1),
                  const BoxShadow(
                      color: Color.fromRGBO(214, 223, 230, 1),
                      offset: Offset(5, 5),
                      blurRadius: 1)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                            title ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Lora',
                              color: globals.textVioletLavanda,
                              fontWeight: FontWeight.bold
                              ),
                          ),
                  ),
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image ?? '',
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        list1 != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.circle, size: 5),
                                  Text(
                                    list1 ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Lora',
                                      color: globals.textVioletLavanda,
                                    ),
                                    ),
                                ],
                              )
                            : const SizedBox(),
                        list2 != null
                            ? Row(
                                children: [
                                  const Icon(Icons.circle, size: 5),
                                  Text(list2 ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        list3 != null
                            ? Row(
                                children: [
                                  const Icon(Icons.circle, size: 5),
                                  Text(list3 ?? ''),
                                ],
                              )
                            : const SizedBox(),
                        list4 != null
                            ? Row(
                                children: [
                                  const Icon(Icons.circle, size: 5),
                                  Text(list4 ?? ''),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 12.0)
              ],
            ),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.white, offset: offset, blurRadius: 1),
                  const BoxShadow(
                      color: Color.fromRGBO(214, 223, 230, 1),
                      offset: Offset(5, 5),
                      blurRadius: 1)
                ]),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 8.0),
                      child: ButtonSmallIconWidget(
                        icon: FontAwesomeIcons.chevronRight,
                         onTap: () {
                          Get.toNamed(link);
                        },
                      )
                    ),
                  ],
                ),
          )
        ],
      ),
    );
  }
}
