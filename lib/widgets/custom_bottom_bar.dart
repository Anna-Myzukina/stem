import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:stem/src/constants.dart' as globals;


// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final Curve curve;
  bool isTabSelected;

  CustomBottomBar({
    super.key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 10,
    this.animationDuration = const Duration(milliseconds: 100),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
    this.isTabSelected = false,
  })  : assert(items.length >= 2 && items.length <= 5);

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? globals.lavanda;
    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18))
          ),
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(top: 22, bottom: 22, left: 5, right: 5),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  onItemSelected(index);
                  isTabSelected = true;
                },
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                  insertIsActive: isTabSelected == true,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;
  final bool insertIsActive;

  const _ItemWidget({
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
    required this.insertIsActive,
  });

  final bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: 60,
        height: 60,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
            color: const Color(0xffedf1f5),
            borderRadius: BorderRadius.circular(itemCornerRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(5, 5),
                  blurRadius: 5,
                  inset: isSelected ? true : false
                  ),
              BoxShadow(
                  color: Colors.white,
                  offset: const Offset(-5, -5),
                  blurRadius: 5,
                  inset: isSelected ? true : false
                  )
            ]),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: 60,
            height: 60,
            //padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [item.icon],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    this.textAlign,
    this.inactiveColor,
    this.activeColor,
  });

  final Widget icon;
  final Color? inactiveColor;
  final Color? activeColor;
  final TextAlign? textAlign;
}