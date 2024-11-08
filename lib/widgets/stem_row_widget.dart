import 'package:flutter/material.dart';
import 'package:stem/src/constants.dart' as globals;

class StemRowWidget extends StatefulWidget {
  const StemRowWidget({
    super.key,
  });

  @override
  State<StemRowWidget> createState() => _StemRowWidgetState();
}

class _StemRowWidgetState extends State<StemRowWidget> with TickerProviderStateMixin {

  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;

   @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _controller2 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _controller3 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();
    _controller4 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward(); // Start the fade-in on initState.
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        FadeTransition(
          opacity: _controller1,
          child: Container(
            height: 45,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: globals.lightGreen),
            child: const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Science',
                style: TextStyle(
                    color: globals.whiteLavanda,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            )),
          ),
        ),
        const SizedBox(width: 5),
        FadeTransition(
          opacity: _controller2,
          child: Container(
            height: 45,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: globals.lightBlue),
            child: const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Technology',
                style: TextStyle(
                    color: globals.whiteLavanda,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            )),
          ),
        ),
        const SizedBox(width: 5),
        FadeTransition(
          opacity: _controller3,
          child: Container(
            height: 45,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: globals.lightOrange),
            child: const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Engineering',
                style: TextStyle(
                    color: globals.whiteLavanda,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            )),
          ),
        ),
        const SizedBox(width: 5),
        FadeTransition(
          opacity: _controller4,
          child: Container(
            height: 45,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: globals.deepPink),
            child: const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Mathematics',
                style: TextStyle(
                    color: globals.whiteLavanda,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            )),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
