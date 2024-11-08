import 'package:flutter/material.dart';

class CustomCardWithShadow extends StatelessWidget {
  final String? text;
  final double width;
  final double? height;
  final Widget? widget;
  final Offset offset;
  final bool isBacgroundImage;
  final String? backgroundImage;
  final bool bottomButton;
  final void Function()? onTap;
  final Color backgroundColor;
  final double aroundPadding;

  const CustomCardWithShadow({
    super.key,
    this.text,
    this.width = 200,
    this.height,
    this.widget,
    this.isBacgroundImage = false,
    this.backgroundImage,
    this.bottomButton = false,
    this.onTap,
    this.offset = const Offset(-3, -3),
    this.backgroundColor = const Color(0xfff1f4f8),
    this.aroundPadding =  18.0
  });

  @override
  Widget build(BuildContext context) {
    return !bottomButton
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: height,
              width: width,
              decoration: isBacgroundImage
                  ? BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset(backgroundImage!).image,
                          fit: BoxFit.cover),
                      color: const Color.fromARGB(130, 217, 230, 243),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              offset: offset,
                              blurRadius: 1),
                          const BoxShadow(
                              color: Color.fromRGBO(214, 223, 230, 1),
                              offset: Offset(5, 5),
                              blurRadius: 1)
                        ])
                  : BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              offset: offset,
                              blurRadius: 1),
                          const BoxShadow(
                              color: Color.fromRGBO(214, 223, 230, 1),
                              offset: Offset(5, 5),
                              blurRadius: 1)
                        ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(aroundPadding),
                    child: widget ?? const Text('widget'),
                  ),
                  SizedBox(height: 8),
                  Text(text ?? '')
                ],
              ),
            ),
          )
        : Column(
            children: [
              Container(
                height: 125,
                decoration: BoxDecoration(
                    color: const Color(0xfff1f4f8),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white, offset: offset, blurRadius: 1),
                      const BoxShadow(
                          color: Color.fromRGBO(214, 223, 230, 1),
                          offset: Offset(5, 5),
                          blurRadius: 1)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget ?? const Text('widget'),
                    const SizedBox(height: 8),
                    Text(text ?? '')
                  ],
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white, offset: offset, blurRadius: 1),
                        const BoxShadow(
                            color: Color.fromRGBO(214, 223, 230, 1),
                            offset: Offset(5, 5),
                            blurRadius: 1)
                      ]),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          ),
                        )
                      ]),
                ),
              )
            ],
          );
  }
}
