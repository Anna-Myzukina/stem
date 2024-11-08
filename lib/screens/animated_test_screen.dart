import 'package:flutter/material.dart';

class AnimatedContainersScreen extends StatefulWidget {
  const AnimatedContainersScreen({super.key});

  @override
  State<AnimatedContainersScreen> createState() => _AnimatedContainersScreenState();
}

class _AnimatedContainersScreenState extends State<AnimatedContainersScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation1;
  late final Animation<Offset> _animation2;
  late final Animation<Offset> _animation3;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Slide-in animations from the left, right, and left respectively
    _animation1 = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Off-screen to the left
      end: Offset.zero,               // Centered position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _animation2 = Tween<Offset>(
      begin: const Offset(1.0, 0.0),  // Off-screen to the right
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _animation3 = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Off-screen to the left
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Fade-in animation for all elements
    _fadeAnimation = Tween<double>(
      begin: 0.0,   // Fully transparent
      end: 1.0,     // Fully opaque
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smooth Animated Containers')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _animation1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _animation2,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _animation3,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}